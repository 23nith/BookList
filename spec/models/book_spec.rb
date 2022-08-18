require 'rails_helper'

RSpec.describe Book, type: :model do
  
  context "Association" do

    it "1. should belong to list_item" do
      t = Book.reflect_on_association(:list_item)
      expect(t.macro).to eq(:belongs_to)
    end

  end

end
