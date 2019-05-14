class ReviewsController < ApplicationController
  def destroy
    user_id = Review.find(params[:id]).user.id
    Review.destroy(params[:id])
    
    redirect_to "/users/#{user_id}"
  end

  def new
  end

  def create
    # require 'pry'; binding.pry
    user = User.find_or_create_by(username: params[:review][:username].titleize)
    book = Book.find(params[:review][:book_id])
    # require 'pry'; binding.pry
    new_review = user.reviews.create({title: params[:review][:title].titleize, rating: params[:review][:rating], review: params[:review][:review], book_id: book.id})
    
    redirect_to "/books/#{book.id}"
  end
end