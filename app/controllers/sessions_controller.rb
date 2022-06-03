class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    redirect_to "/dashboard"
    
  #   if user != nil
  #     session[:user_id] = user.id
  #     flash[:success] = "Welcome, #{user.email}!"
  #     redirect_to "/dashboard"
  #   else
  #     flash[:error] = "Sorry, your credentials are bad."
  #     render :new
  #   end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
