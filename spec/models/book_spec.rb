# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'Association' do
    it 'Should have many list_items' do
      t = User.reflect_on_association(:list_items)
      expect(t.macro).to eq(:has_many)
    end

    it 'Should have many users through list items' do
      should respond_to(:users)
    end
  end
end
