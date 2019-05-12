class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.order_reviews_by_date_asc
  end

 


end

