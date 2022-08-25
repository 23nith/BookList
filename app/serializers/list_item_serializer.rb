class ListItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :rating, :notes, :start_date, :finish_date
end
