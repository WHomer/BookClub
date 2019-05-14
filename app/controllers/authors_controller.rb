class AuthorsController < ApplicationController
  def index
    #queryingstuff
    @to_show = params[:id].to_i
    authors = Author.all
    @left = []; @mid = []; @right = []; @books = {}
    i = 0
    authors.each do |author|
      @books[author.id] = author.books
      case i
      when 0; @left << author
      when 1; @mid << author
      when 2; @right << author
      end
      i += 1; i = 0 if i > 2
    end

    # @backgrounds = ['#c00', '#c60', '#c90', '#3c0', '#39f', '#969', '#606']
    @backgrounds = ['red darken-2', 'orange darken-4', 'amber darken-3', 'green darken-2', 'blue darken-2', 'purple darken-2']
  end

  def show
    @author = Author.find(params[:id]);
  end

  def destroy
    Author.destroy(params[:id])
    redirect_to "/authors"
  end
end