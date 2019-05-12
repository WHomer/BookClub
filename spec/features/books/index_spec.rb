require 'rails_helper'

RSpec.describe "As a visitor," do
  describe "when visiting root," do
    before :each do
      @book1 = Book.create! title: "Book 1", page_count: "100", year_published: "10", image_url: "http://lorempixel.com/400/600/cats"
      @book2 = Book.create! title: "Book 2", page_count: "110", year_published: "20", image_url: "http://lorempixel.com/400/600/cats"
      @book3 = Book.create! title: "Book 3", page_count: "120", year_published: "30", image_url: "http://lorempixel.com/400/600/cats"
      @book4 = Book.create! title: "Book 4", page_count: "130", year_published: "40", image_url: "http://lorempixel.com/400/600/cats"
      @book5 = Book.create! title: "Book 5", page_count: "140", year_published: "50", image_url: "http://lorempixel.com/400/600/cats"
    end

    it "sees a title" do
      visit "/"

      within("#book-title-#{@book1.id}") do
        expect(page).to have_content(@book1.title)
      end
      within("#book-title-#{@book2.id}") do
        expect(page).to have_content(@book2.title)
      end
      within("#book-title-#{@book3.id}") do
        expect(page).to have_content(@book3.title)
      end
      within("#book-title-#{@book4.id}") do
        expect(page).to have_content(@book4.title)
      end
      within("#book-title-#{@book5.id}") do
        expect(page).to have_content(@book5.title)
      end
    end

    it "sees an author and page count" do
      visit "/"

      within("#book-content#{@book1.id}") do
        
      end
    end

    it "sees average reviews and review count" do

    end
  end
end