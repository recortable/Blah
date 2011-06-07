class MessagesController < ApplicationController
  respond_to :html
  before_filter :require_user
  expose(:messages) { Message.all }
  expose(:message)
  expose(:message_response) { Message.new(:title => message.title, :parent => message)}

  def index

  end

  def show
    authorize! :show, message
    redirect_to message.parent if message.parent.present?
  end

  def edit
    authorize! :edit, message
  end


  def create
    authorize! :create, message
    message.user = current_user
    message.group = current_group
    flash[:notice] = "Lo tenemos!" if message.save
    respond_with message
  end
end
