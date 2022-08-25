# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :list_items
  has_many :users, through: :list_items

  validates :title, presence: true
  validates :author, presence: true
  validates :cover_image_url, presence: true
  validates :page_count, presence: true, numericality: true
  validates :publisher, presence: true
  validates :synopsis, presence: true
end
