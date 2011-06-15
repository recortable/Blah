# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  include Controllers::AuthMethods
  helper_method :current_user, :current_user?



  expose(:current_group) do
    session[:group_id] ||= 1
    Group.find session[:group_id]
  end
  expose(:last_messages) { Message.order('id DESC').limit(20)}
  expose(:new_message) { Message.new }




  def info_for_paper_trail
    {:user_name => current_user? ? current_user.name : 'Anónimx',
     :group_id => current_group.id}
  end


  rescue_from ActionView::TemplateError do |x|
    #bubble up the original exception
    #ActiveRecord::RecordNotFound
    raise x.original_exception
  end

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to root_url, :notice => t('access_denied.no_privilegies')
    else
      redirect_to root_url, :notice => t('access_denied.no_user')
    end
  end

end
