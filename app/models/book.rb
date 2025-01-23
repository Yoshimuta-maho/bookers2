class Book < ApplicationRecord
  has_one_attached :book
  belongs_to :user
end
