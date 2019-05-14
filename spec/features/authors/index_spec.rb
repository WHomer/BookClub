require 'rails_helper'

RSpec.describe "As a visitor," do
  describe "when visiting authors," do
    before :each do
      Book.destroy_all
      Author.destroy_all
      User.destroy_all
      @book1 = Book.create! title: "Book 1", page_count: "100", year_published: "10", image_url: "http://lorempixel.com/400/600/cats"
      @book2 = Book.create! title: "Book 2", page_count: "110", year_published: "20", image_url: "http://lorempixel.com/400/600/cats"
      @book3 = Book.create! title: "Book 3", page_count: "120", year_published: "30", image_url: "http://lorempixel.com/400/600/cats"
      @book4 = Book.create! title: "Book 4", page_count: "130", year_published: "40", image_url: "http://lorempixel.com/400/600/cats"
      @book5 = Book.create! title: "Book 5", page_count: "140", year_published: "50", image_url: "http://lorempixel.com/400/600/cats"

      @author1 = Author.create! name: "A", image_url: "http://lorempixel.com/400/600/cats"
      @author2 = Author.create! name: "B", image_url: "http://lorempixel.com/400/600/cats"
      @author3 = Author.create! name: "C", image_url: "http://lorempixel.com/400/600/cats"
      @author4 = Author.create! name: "D", image_url: "http://lorempixel.com/400/600/cats"
      @author5 = Author.create! name: "E", image_url: "http://lorempixel.com/400/600/cats"

      @author1.books << @book1
      @author2.books << @book2
      @author3.books << @book3
      @author4.books << @book4
      @author5.books << @book5

      @book1_author = "A"
      @book2_author = "B"
      @book3_author = "C"
      @book4_author = "D"
      @book5_author = "E"

      @reviewinator = User.create! username: "Reviewinator"
      @reviewinator.reviews.create! title: 'It was A book', review: 'hec', rating: 5, book_id: @book1.id
      @reviewinator.reviews.create! title: 'It was B book', review: 'hecc', rating: 4, book_id: @book2.id
      @reviewinator.reviews.create! title: 'It was C book', review: 'heccc', rating: 3, book_id: @book3.id
      @reviewinator.reviews.create! title: 'It was D book', review: 'hecccc', rating: 2, book_id: @book4.id
      @reviewinator.reviews.create! title: 'It was E book', review: 'heccccc', rating: 1, book_id: @book5.id
    end

    it "shows authors" do
      visit "/authors"

      within("#author-title-#{@author1.id}") do
        expect(page).to have_content(@author1.name)
      end
      within("#author-title-#{@author2.id}") do
        expect(page).to have_content(@author2.name)
      end
      within("#author-title-#{@author3.id}") do
        expect(page).to have_content(@author3.name)
      end
      within("#author-title-#{@author4.id}") do
        expect(page).to have_content(@author4.name)
      end
      within("#author-title-#{@author5.id}") do
        expect(page).to have_content(@author5.name)
      end
    end
  end
end