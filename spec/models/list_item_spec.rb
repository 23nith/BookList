require 'rails_helper'

RSpec.describe ListItem, type: :model do
  
  context "Association" do

    it "1. should belong to book" do
       t = ListItem.reflect_on_association(:books)
       expect(t.macro).to eq(:belongs_to)
     end
 
     it "2. should belong to user" do
       t = ListItem.reflect_on_association(:users)
       expect(t.macro).to eq(:belongs_to)
     end
 
   end
 
end
