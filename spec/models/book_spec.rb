require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it {should have_many :reviews}
  end

  describe 'instance variables' do
    before :each do
      meg  = User.create!(username: 'Meg Griffen')
      @hp_prisoner = Book.create!(title: "Harry Potter and the Prisoner of Azkaban", page_count: 1234 , year_published: "2010-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/dd/b9/ddb96bc09edd9c6593241315251434f414f4141.jpg" )
      meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 4, book_id: @hp_prisoner.id)
      meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_prisoner.id)
      meg.reviews.create!(title: 'It was only bad', review: '3asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_prisoner.id)
    end

    it '.average_book_rating' do
      expect(@hp_prisoner.average_book_rating.round).to eq(3)
    end

    it '.count_book_reviews' do
      expect(@hp_prisoner.count_book_reviews).to eq(3)
    end
  end

end
