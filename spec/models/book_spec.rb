require 'rails_helper'

RSpec.describe Book, type: :model do
  
  context "Association" do

    it "1. should have many list_items" do
      t = User.reflect_on_association(:list_items)
      expect(t.macro).to eq(:has_many)
    end

    it '2. should have many users through list items' do
      should respond_to(:users)
    end

  end

end
