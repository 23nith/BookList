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
class ListItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :rating, :notes, :start_date, :finish_date
end
