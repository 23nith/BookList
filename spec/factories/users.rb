# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'luke' }
    password { 'my_password' }
  end
end
