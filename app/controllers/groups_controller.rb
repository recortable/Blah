class GroupsController < ApplicationController
  def enter
    session[:group_id] = params[:id]
    redirect_to root_path
  end
end
