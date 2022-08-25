# frozen_string_literal: true
require 'faker'

FactoryBot.define do
  factory :user do
    username { 'luke' }
    password { 'my_password' }
  end

  factory :random_user, class: User do
    username { Faker::Internet.username }
    password { Faker::Internet.password(min_length: 8) }
  end
end

