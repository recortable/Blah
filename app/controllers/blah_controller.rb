class BlahController < ApplicationController
  def about

  end

  expose(:notifications) { Notification.pending.order('id DESC') }
  def status

  end

  expose(:activity_size) { Activity.count }
  expose(:activities) { Activity.order('id DESC').limit(30) }
  def perform_jobs
    Activity.create!(:description => "Work (#{notifications.count})")
    notifications.each do |n|
      UserMailer.new_message_email(n.user, n.message, n.message.root).deliver
      n.close
      Activity.create!(:description => 'Email sent', :resource => n)
    end
    redirect_to status_path
  end
end
