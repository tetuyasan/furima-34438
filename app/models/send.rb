class Send < ApplicationRecord
  has_one :send
  belongs_to :user
  belongs_to :item
end
