class BlahController < ApplicationController
  before_filter :require_user, :except => [:about, :contact]

  def about

  end

  def contact
    notice = "No se ha podido enviar el mensaje."
    if params[:body].present? and params[:name].blank?
      message = Message.new(:title => 'Alguien ha escrito a CyL')
      message.body = params[:body]
      message.user_id = 1
      message.group = current_group
      notice = 'Mensaje enviado.' if message.save
    end
    redirect_to login_path, :notice => notice
  end

  expose(:notifications) { Notification.pending.order('id DESC') }

  def status

  end

  expose(:activity_size) { Activity.count }
  expose(:activities) { Activity.order('id DESC').limit(30) }

  def perform_jobs
    Activity.create!(:description => "Work (#{notifications.count})")

    while n = Notification.pending.first
      n.close
      UserMailer.new_message_email(n.user, n.message, n.message.root).deliver
      Activity.create!(:description => 'Email sent', :resource => n)
    end
    redirect_to status_path
  end
end
