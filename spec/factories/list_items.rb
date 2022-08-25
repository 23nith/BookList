# frozen_string_literal: true

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
