class ReviewsController < ApplicationController
  def destroy
    user_id = Review.find(params[:id]).user.id
    Review.destroy(params[:id])
    
    redirect_to "/users/#{user_id}"
  end
end