# frozen_string_literal: true

class ListItem < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
