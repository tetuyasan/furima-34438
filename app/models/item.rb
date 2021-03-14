class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :area
  belongs_to :shipping
  belongs_to :user

  has_one_attached :image

  validates :item_name, :image, presence: true
  validates :item_name, presence:true
  validates :comment, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :area_id, presence: true 
  validates :shipping_id, presence:true
  validates :item_price, presence:true
  validates_inclusion_of :item_price, in: 300..9999999, message: 'Out of setting range'

  validates :item_price, numericality: { with: /\A[0-9]+\z/ ,message: 'Half-width number'}
end
