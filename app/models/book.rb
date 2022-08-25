# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id              :bigint           not null, primary key
#  title           :string
#  author          :string
#  cover_image_url :string
#  page_count      :integer
#  publisher       :string
#  synopsis        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
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
