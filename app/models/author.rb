class Author < ApplicationRecord
  has_many :author_books, :dependent => :delete_all
  has_many :books, through: :author_books, :dependent => :delete_all

  validates_presence_of :name
end
