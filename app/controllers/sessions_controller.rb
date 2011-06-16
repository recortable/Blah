# encoding: utf-8

class SessionsController < ApplicationController
  def new

  end

  def create
    user = current_group.users.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user.present?
      self.current_user = user
      user.update_attributes(:last_login_at => Time.now, :login_count => user.login_count + 1)
      redirect_to root_path, :notice => "Bienvenidx a #{current_group.name}!"
    else
      flash[:notice] = "La dirección o el correo está mal. Inténtalo de nuevo o contacta con el el administrador web."
      render :action => :new
    end
  end

  def destroy
    self.clear_user
    flash[:notice] = 'Vuelve pronto!'
    redirect_to login_path
  end

  def enter
    if Rails.env.development? or current_user.super?
      self.current_user = User.find params[:id]
      flash[:notice] = "Te has colao como #{current_user.name}"
    end
    redirect_to user_path(current_user)
  end
end
