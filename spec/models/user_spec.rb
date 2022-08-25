# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation' do
    let!(:user) { User.new }

    it '1. is not valid without username' do
      user.password = 'password'
      expect(user).to_not be_valid
    end

    it '2. is not valid without password' do
      user.username = 'john'
      expect(user).to_not be_valid
    end

    it '2. is not valid if password is less than 8 characters' do
      user.username = 'john@username.com'
      user.password = 'passwor'
      expect(user).to_not be_valid
    end

    it '4. is valid if all fields are correct' do
      user.username = 'john@username.com'
      user.password = 'password'
      expect(user).to be_valid
    end
  end

  context 'Association' do
    it '1. should have many list_items' do
      t = User.reflect_on_association(:list_items)
      expect(t.macro).to eq(:has_many)
    end

    it '2. should have many books through list items' do
      should respond_to(:books)
    end
  end
end
