class BooksController < ApplicationController
  def index
    #queryingstuff

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
    @backgrounds = ['#c00', '#c60', '#c90', '#3c0', '#39f', '#969', '#606']
  end
end