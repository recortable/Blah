class UsersController < ApplicationController
  before_filter :require_user
  respond_to :html

  expose(:users) { current_group.users }
  expose(:user)

  def index

  end

  def edit
    authorize! :edit, user
  end

  def show
    authorize! :read, user
  end

  def update
    authorize! :update, user
    flash[:notice] = 'Tus datos se han modificado.' if user.update_attributes(params[:user])
    respond_with user
  end
end
