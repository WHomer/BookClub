class Book < ApplicationRecord
  has_many :reviews

  def average_book_rating
    reviews.average(:rating)
  end

  def count_book_reviews
    reviews.count
  end

  def top_three_reviews
    reviews.order('rating DESC, id ASC').limit(3)
  end

  def bottom_three_reviews
    reviews.order('rating ASC, id ASC').limit(3)
  end

  def average_rating
    reviews.average('rating')
  end

  def self.sort_average_rating(order)
    if order.upcase == 'ASC' || order.upcase == 'ASCENDING'
      select('books.*, COALESCE(AVG(reviews.rating), 0) as average_rating').left_joins(:reviews).group('books.id').order('average_rating ASC, books.title ASC')
    elsif order.upcase == 'DESC' || order.upcase == 'DESCENDING'  
      select('books.*, COALESCE(avg(reviews.rating), 0) as average_rating').left_joins(:reviews).group('books.id').order('average_rating DESC, books.title ASC')
    end
  end

  def self.sort_number_pages(order)
    if order.upcase == 'ASC' || order.upcase == 'ASCENDING'
      select('books.*').order('books.page_count ASC, books.title ASC')
    elsif order.upcase == 'DESC' || order.upcase == 'DESCENDING'
      select('books.*').order('books.page_count DESC, books.title ASC')
    end
  end

  def self.sort_number_reviews(order)
    if order.upcase == 'ASC' || order.upcase == 'ASCENDING'
      select('books.*, count(reviews.rating) as count_rating').left_joins(:reviews).group('books.id').order('count_rating ASC, books.title ASC')
    elsif order.upcase == 'DESC' || order.upcase == 'DESC'
      select('books.*, count(reviews.rating) as count_rating').left_joins(:reviews).group('books.id').order('count_rating DESC, books.title ASC')
    end
  end

  def self.stat_three_best_rated
    select('books.*, COALESCE(avg(reviews.rating), 0) as average_rating').left_joins(:reviews).group('books.id').order('average_rating DESC, books.title ASC').limit(3)
  end

  def self.stat_three_worst_rated
    select('books.*, COALESCE(avg(reviews.rating), 0) as average_rating').left_joins(:reviews).group('books.id').order('average_rating ASC, books.title ASC').limit(3)
  end

  def self.stat_three_users_most_reviews
    User.select('users.*, count(reviews.id) as review_count').left_joins(:reviews).group('users.id').order('review_count DESC, users.id ASC').limit(3)
  end

end