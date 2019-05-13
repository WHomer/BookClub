class UsersController < ApplicationController
  def index
    #queryingstuff
    @to_show = params[:id].to_i
    users = User.all
    @left = []; @mid = []; @right = []; @reviews = {}
    i = 0
    users.each do |user|
      @reviews[user.id] = user.reviews
      case i
      when 0; @left << user
      when 1; @mid << user
      when 2; @right << user
      end
      i += 1; i = 0 if i > 2
    end

    # @backgrounds = ['#c00', '#c60', '#c90', '#3c0', '#39f', '#969', '#606']
    @backgrounds = ['red darken-2', 'orange darken-4', 'amber darken-3', 'green darken-2', 'blue darken-2', 'purple darken-2']
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.order_reviews_by_date_asc
    @reviews = @user.order_reviews_by_date_desc if params[:order_date] == "DESC"
  end
end

