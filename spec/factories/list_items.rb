# frozen_string_literal: true

FactoryBot.define do
  factory :list_item do
    book { nil }
    user { nil }
    rating { 1 }
    notes { 'MyText' }
    start_date { Date.now }
    finish_date { Date.now }
  end
end
