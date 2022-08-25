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
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation' do
    let!(:user) { User.new }

    it 'Is not valid without username' do
      user.password = 'password'
      expect(user).to_not be_valid
    end

    it 'Is not valid without password' do
      user.username = 'john'
      expect(user).to_not be_valid
    end

    it 'Is not valid if password is less than 8 characters' do
      user.username = 'john@username.com'
      user.password = 'passwor'
      expect(user).to_not be_valid
    end

    it 'Is valid if all fields are correct' do
      user.username = 'john@username.com'
      user.password = 'password'
      expect(user).to be_valid
    end
  end

  context 'Association' do
    it 'Should have many list_items' do
      t = User.reflect_on_association(:list_items)
      expect(t.macro).to eq(:has_many)
    end

    it 'Should have many books through list items' do
      should respond_to(:books)
    end
  end
end
