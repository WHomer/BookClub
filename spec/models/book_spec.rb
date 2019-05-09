require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it {should have_many :reviews}
  end

  describe 'instance variables' do
    before :each do
      @meg  = User.create!(username: 'Meg Griffen')
      @hp_prisoner = Book.create!(title: "Harry Potter and the Prisoner of Azkaban", page_count: 1234 , year_published: "2010-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/dd/b9/ddb96bc09edd9c6593241315251434f414f4141.jpg" )
      @hp_sorcerer = Book.create!(title: "Harry Potter and the Sorcerer's Stone", page_count: 903 , year_published: "2019-05-08" , image_url: "https://pics.cdn.librarything.com/picsizes/bd/73/bd73e9ebf18b34a593551665267434f414f4141.jpg" )
      @hp_chamber = Book.create!(title: "Harry Potter and the Chamber of Secrets", page_count: 234 , year_published: "2009-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/d9/d1/d9d13615817b9be593272635351434f414f4141.jpg" )
      @hp_half = Book.create!(title: "Harry Potter and the Half-Blood Prince", page_count: 432 , year_published: "2011-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/c3/7f/c37f9cd35eeb1065930546a5251434f414f4141.jpg" )
      @hp_order = Book.create!(title: "Harry Potter and the Order of the Phoenix", page_count: 543 , year_published: "2012-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/ef/59/ef59930168456ea593072765351434f414f4141.jpg" )
      @meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 4, book_id: @hp_prisoner.id)
      @meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_prisoner.id)
      @meg.reviews.create!(title: 'It was only bad', review: '3asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_prisoner.id)
      @meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_sorcerer.id)
      @meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_sorcerer.id)      
      @meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_half.id)
      @meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_order.id)
      @meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_order.id)
    end

    it '.average_book_rating' do
      expect(@hp_prisoner.average_book_rating.round).to eq(3)
    end

    it '.count_book_reviews' do
      expect(@hp_prisoner.count_book_reviews).to eq(3)
    end

    it '.sort_average_rating' do
      expect(Book.sort_average_rating('ASC')).to eq([@hp_chamber, @hp_order, @hp_sorcerer, @hp_prisoner, @hp_half]) 
      expect(Book.sort_average_rating('DESC')).to eq([@hp_half, @hp_prisoner, @hp_sorcerer, @hp_order, @hp_chamber]) 
    end

    it '.sort_number_of_pages' do
      expect(Book.sort_number_pages('ASC')).to eq([@hp_chamber, @hp_half, @hp_order, @hp_sorcerer, @hp_prisoner])
      expect(Book.sort_number_pages('DESC')).to eq([@hp_prisoner, @hp_sorcerer, @hp_order, @hp_half, @hp_chamber])
    end

    it '.sort_number_of_reviews' do
      expect(Book.sort_number_reviews('ASC')).to eq([@hp_chamber, @hp_half, @hp_order, @hp_sorcerer, @hp_prisoner])
      expect(Book.sort_number_reviews('DESC')).to eq([@hp_prisoner, @hp_order, @hp_sorcerer, @hp_half, @hp_chamber])
    end

    it '.stat_three_best_rated' do
      expect(Book.stat_three_best_rated()).to eq([@hp_half, @hp_prisoner, @hp_sorcerer])
    end
  end
end


# - thre three worst-rated books (book title and average rating)
# - three users who have written the most reviews (user name and review count)