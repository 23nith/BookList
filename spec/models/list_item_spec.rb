# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListItem, type: :model do
  context 'Association' do
    it 'Should belong to book' do
      t = ListItem.reflect_on_association(:book)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'Should belong to user' do
      t = ListItem.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
