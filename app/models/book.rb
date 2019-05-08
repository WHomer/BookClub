class Book < ApplicationRecord
  has_many :reviews

  def average_book_rating
    reviews.average(:rating)
  end

  def count_book_reviews
    reviews.count
  end

  def self.sort_average_rating(order)
    if order.upcase == 'ASC' || order.upcase == 'ASCENDING'
      select('books.*, avg(reviews.rating) as average_rating').joins(:reviews).group('books.id').order('average_rating ASC')
    elsif order.upcase == 'DESC' || order.upcase == 'DESCENDING'  
      select('books.*, avg(reviews.rating) as average_rating').joins(:reviews).group('books.id').order('average_rating DESC')
    end
  end

  def self.sort_number_pages(order)
    if order.upcase == 'ASC' || order.upcase == 'ASCENDING'
      select('books.*').order('books.page_count ASC')
    elsif order.upcase == 'DESC' || order.upcase == 'DESCENDING'
      select('books.*').order('books.page_count DESC')
    end
  end

  def self.sort_number_reviews(order)
    if order.upcase == 'ASC' || order.upcase == 'ASCENDING'
      select('books.*, count(reviews.rating) as count_rating').joins(:reviews).group('books.id').order('count_rating ASC')
    elsif order.upcase == 'DESC' || order.upcase == 'DESC'
      select('books.*, count(reviews.rating) as count_rating').joins(:reviews).group('books.id').order('count_rating DESC')
    end
  end
end