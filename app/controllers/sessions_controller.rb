class SessionsController < ApplicationController
  def new; end

  def create
    session[:user_id] = params[:user_id]
    session[:user_photo] = params[:user_photo]
    redirect_to "/dashboard"
  end

  def destroy
    session.destroy
    flash[:success] = "Successfully Logged Out"
    redirect_to root_path
  end
end
