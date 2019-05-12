class BooksController < ApplicationController
  def index
    #queryingstuff
    @to_show = params[:id].to_i
    books = Book.all
    @left = []; @mid = []; @right = []
    i = 0
    books.each do |book|
      case i
      when 0; @left << book
      when 1; @mid << book
      when 2; @right << book
      end
      i += 1; i = 0 if i > 2
    end

    # @backgrounds = ['#c00', '#c60', '#c90', '#3c0', '#39f', '#969', '#606']
    @backgrounds = ['red', 'orange darken-2', 'yellow darken-3', 'green', 'blue darken-2', 'purple']
  end

  def show
    redirect_to action: 'index', id: params[:id]
  end
end