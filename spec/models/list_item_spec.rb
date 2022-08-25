# frozen_string_literal: true

# == Schema Information
#
# Table name: list_items
#
#  id          :bigint           not null, primary key
#  book_id     :bigint           not null
#  user_id     :bigint           not null
#  rating      :integer
#  notes       :text
#  start_date  :date
#  finish_date :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
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
