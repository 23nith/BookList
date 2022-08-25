# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id              :bigint           not null, primary key
#  title           :string
#  author          :string
#  cover_image_url :string
#  page_count      :integer
#  publisher       :string
#  synopsis        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
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
