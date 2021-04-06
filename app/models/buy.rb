class Buy < ApplicationRecord
  has_one :house
  belongs_to :user
  belongs_to :item
end
