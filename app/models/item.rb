class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :area
  belongs_to :shipping
  belongs_to :user
  has_one :buy

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :comment
    validates :item_price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_id
    validates :area_id
  end

  validates_inclusion_of :item_price, in: 300..9999999, message: 'は300円から9999999円までにしてください'

  validates :item_price, numericality: { with: /\A[0-9]+\z/ ,message: 'は半角の数字にしてください'}
end
