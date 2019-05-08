require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it {should have_many :reviews}
  end

  describe 'instance variables' do
    before :each do
      meg  = User.create!(username: 'Meg Griffen')
      @hp_prisoner = Book.create!(title: "Harry Potter and the Prisoner of Azkaban", page_count: 1234 , year_published: "2010-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/dd/b9/ddb96bc09edd9c6593241315251434f414f4141.jpg" )
      @hp_sorcerer = Book.create!(title: "Harry Potter and the Sorcerer's Stone", page_count: 903 , year_published: "2019-05-08" , image_url: "https://pics.cdn.librarything.com/picsizes/bd/73/bd73e9ebf18b34a593551665267434f414f4141.jpg" )
      @hp_chamber = Book.create!(title: "Harry Potter and the Chamber of Secrets", page_count: 234 , year_published: "2009-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/d9/d1/d9d13615817b9be593272635351434f414f4141.jpg" )
      meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 4, book_id: @hp_prisoner.id)
      meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_prisoner.id)
      meg.reviews.create!(title: 'It was only bad', review: '3asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_prisoner.id)
      meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_sorcerer.id)
      meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_sorcerer.id)
    end

    it '.average_book_rating' do
      expect(@hp_prisoner.average_book_rating.round).to eq(3)
    end

    it '.count_book_reviews' do
      expect(@hp_prisoner.count_book_reviews).to eq(3)
    end

    it '.sort_average_rating' do
      expect(Book.sort_average_rating('ASC')).to eq([@hp_sorcerer, @hp_prisoner, @hp_chamber]) 
      expect(Book.sort_average_rating('DESC')).to eq([@hp_chamber, @hp_prisoner, @hp_sorcerer]) 
    end

    it '.sort_number_of_pages' do
      expect(Book.sort_number_pages('ASC')).to eq([@hp_chamber, @hp_sorcerer, @hp_prisoner])
      expect(Book.sort_number_pages('DESC')).to eq([@hp_prisoner, @hp_sorcerer, @hp_chamber])
    end

    it '.sort_number_of_reviews' do
      expect(Book.sort_number_reviews('ASC')).to eq([@hp_chamber, @hp_sorcerer, @hp_prisoner])
      expect(Book.sort_number_reviews('DESC')).to eq([@hp_prisoner, @hp_sorcerer, @hp_chamber])
    end
  end

end
