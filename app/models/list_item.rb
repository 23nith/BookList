# frozen_string_literal: true

class ListItem < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { in: 1..5 }
end
