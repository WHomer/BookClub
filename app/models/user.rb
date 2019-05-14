class User < ApplicationRecord
  has_many :reviews

  validates_presence_of :username

  def order_reviews_by_date_asc
    reviews.order("reviews.created_at ASC")
  end

  def order_reviews_by_date_desc
    reviews.order("reviews.created_at DESC")
  end
end
