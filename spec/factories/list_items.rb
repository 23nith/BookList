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
FactoryBot.define do
  factory :list_item do
    book { nil }
    user { nil }
    rating { 1 }
    notes { 'MyText' }
    start_date { Date.new }
    finish_date { Date.new }
  end
end
