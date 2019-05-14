require 'rails_helper'

RSpec.describe "As a visitor, " do
  describe "when visiting authors, " do
    before :each do
      @peter = User.create!(username: 'Peter Griffen')
      @brian = User.create!(username: 'Brian Griffen')
      @meg  = User.create!(username: 'Meg Griffen')
      @joe = User.create!(username: 'Joe Swanson')

      @jk_rowling = Author.create!(name: 'J. K. Rowling', image_url: 'https://pics.librarything.com/picsizes/3e/9b/3e9bc00722b81c46367767669774330414f6744.jpg')
      @dumbledore = Author.create!(name: 'Albus Dumbledore', image_url: 'https://pics.librarything.com/picsizes/29/8a/298a29de773bddc6368334f6e514330414f6744.jpg')
      
      @hp_prisoner = Book.create!(title: "Harry Potter and the Prisoner of Azkaban", page_count: 1234 , year_published: "2010-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/dd/b9/ddb96bc09edd9c6593241315251434f414f4141.jpg" )
      @hp_sorcerer = Book.create!(title: "Harry Potter and the Sorcerer's Stone", page_count: 903 , year_published: "2019-05-08" , image_url: "https://pics.cdn.librarything.com/picsizes/bd/73/bd73e9ebf18b34a593551665267434f414f4141.jpg" )
      @hp_chamber = Book.create!(title: "Harry Potter and the Chamber of Secrets", page_count: 234 , year_published: "2009-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/d9/d1/d9d13615817b9be593272635351434f414f4141.jpg" )
      @hp_half = Book.create!(title: "Harry Potter and the Half-Blood Prince", page_count: 432 , year_published: "2011-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/c3/7f/c37f9cd35eeb1065930546a5251434f414f4141.jpg" )
      @hp_order = Book.create!(title: "Harry Potter and the Order of the Phoenix", page_count: 543 , year_published: "2012-01-01" , image_url: "https://pics.cdn.librarything.com/picsizes/ef/59/ef59930168456ea593072765351434f414f4141.jpg" )
      
      @jk_rowling.books << [@hp_prisoner, @hp_sorcerer, @hp_chamber, @hp_half]
      @dumbledore.books << [@hp_prisoner, @hp_sorcerer, @hp_order]

      @review_1 = @meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 4, book_id: @hp_prisoner.id)
      @review_2 = @meg.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 4, book_id: @hp_prisoner.id)
      @review_3 = @meg.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_prisoner.id)
      @review_4 = @meg.reviews.create!(title: 'It was only bad', review: '3asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_prisoner.id)
      @review_5 = @peter.reviews.create!(title: 'It was only OK', review: '1asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_sorcerer.id)
      @review_6 = @peter.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_sorcerer.id)     
      @review_7 = @peter.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 3, book_id: @hp_half.id)
      @review_8 = @joe.reviews.create!(title: 'It was only sucked', review: '2asdfasdfadsfadsfadfasdfa', rating: 1, book_id: @hp_order.id)
    end

    it "I see a delete anchor on each author" do
      visit "/authors"
      
      within(page.all(".card-action")[0]) do
        expect(page).to have_css("a[href*='/authors/#{@jk_rowling.id}']")
        click_link("Delete")
      end

      expect(page).to have_current_path("/authors")
      expect(page).to have_content(@dumbledore.name)
    end
  end
end


# As a Visitor,
# When I visit an author's show page,
# I see a link on the page to delete the author.
# This link should return me to the book index page where I
# no longer see this author listed.
# If this author was the only author for any book, that book is also deleted.
# If this author co-authored a book with someone else, that book should also be deleted, but not the other author.

# (you may need to delete other content before you can delete an author or book)