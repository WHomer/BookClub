class BooksController < ApplicationController
  def index
    #queryingstuff
    @to_show = params[:id].to_i
    books = Book.all
    @left = []; @mid = []; @right = []; @reviews = {}
    i = 0
    books.each do |book|
      @reviews[book.id] = book.reviews
      case i
      when 0; @left << book
      when 1; @mid << book
      when 2; @right << book
      end
      i += 1; i = 0 if i > 2
    end

    @top_three = Book.stat_three_best_rated
    @bottom_three = Book.stat_three_worst_rated
    @top_users = []

    # @backgrounds = ['#c00', '#c60', '#c90', '#3c0', '#39f', '#969', '#606']
    @backgrounds = ['red darken-2', 'orange darken-4', 'amber darken-3', 'green darken-2', 'blue darken-2', 'purple darken-2']
    @foregrounds = ['red lighten-1', 'orange', 'amber lighten-1', 'green lighten-2', 'blue lighten-2', 'purple lighten-2']
  end

  def show
    redirect_to action: 'index', id: params[:id]
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to "/books"
  end

  def new
    @book = Book.new
    require 'pry'; binding.pry
  end

  def create
    require 'pry'; binding.pry
    image_path = nil
    image_path = params[:creator][:image] if params[:creator][:image] != ""
    created = Book.new({title: params[:creator][:authors], age: params[:creator][:pages],
      year: params[:creator][:year], image_path: image_path})
    created.save
    redirect_to '/books'
  end
end
