class DashboardController < ApplicationController
  def show
    @user = UserFacade.user(session[:user_id])
  end
end
