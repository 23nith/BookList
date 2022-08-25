# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'MyString' }
    author { 'MyString' }
    cover_image_url { 'MyString' }
    page_count { 1 }
    publisher { 'MyString' }
    synopsis { 'MyText' }
  end
end
