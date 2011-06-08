class UsersController < ApplicationController
  before_filter :require_user
  respond_to :html

  expose(:users) { current_group.users }
  expose(:user)

  def index

  end

  def show
    authorize! :read, user
  end

  def new
    authorize! :new, user
  end

  def edit
    authorize! :edit, user
  end

  def create
    authorize! :create, user
    invited = User.find_by_email(params[:email])
    invited ||= user
    invited.password = "entrar"
    invited.password_confirmation = "entrar"
    User.transaction do
      if invited.save!
        current_group.users << invited
        current_group.save!
        flash[:notice] = "#{invited.name} ha sido invitadx a participar en #{current_group.name}"
      else
        flash[:notice] = "No se ha podido invitar a #{invited.name}"
      end
    end
    respond_with invited
  end


  def update
    authorize! :update, user
    flash[:notice] = 'Tus datos se han modificado.' if user.update_attributes(params[:user])
    respond_with user
  end
end
