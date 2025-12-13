# frozen_string_literal: true

# == Schema Information
#
# Table name: list_items
#
#  id          :bigint           not null, primary key
#  book_id     :bigint           not null
#  user_id     :bigint           not null
#  rating      :integer
#  notes       :text
#  start_date  :date
#  finish_date :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ListItem < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { in: 0..5 }
end
