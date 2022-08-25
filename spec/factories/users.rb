# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  username               :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  jti                    :string           not null
#
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

