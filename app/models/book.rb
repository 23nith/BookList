class Book < ApplicationRecord
  has_many :list_items
  has_many :users, through: :list_items
end
