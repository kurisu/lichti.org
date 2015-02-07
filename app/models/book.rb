class Book < ActiveRecord::Base
  validates :title, length: { minimum: 5 }
  validates :author, length: { minimum: 5 }
end
