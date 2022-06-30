class TripCommentsController < ApplicationController
  def new
    @trip_id = params[:trip_id]
    @user = UserFacade.users
  end

  def create
    TripFacade.add_comment_to_trip(params[:trip_id], params[:user_id], params[:message])
    redirect_to "/trips/#{params[:trip_id]}"
  end

  def destroy
    TripFacade.delete_comment_on_trip(params[:trip_id], params[:comment_id])
    redirect_to "/trips/#{params[:trip_id]}"
  end
end
