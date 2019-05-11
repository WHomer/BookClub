class AuthorsController < ApplicationController

  def show
    # require 'pry'; binding.pry
    @author = Author.find(params[:id]);
  end

end