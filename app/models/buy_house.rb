class BuyHouse
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :address, :building, :phone_number, :user_id, :token, :item_id

  with_options presence: true do
    validates :city
    validates :address
    validates :token
    validates :user_id
    validates :item_id
    validates :phone_number, length: { maximum: 11}
    validates :phone_number, numericality:true
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    House.create(phone_number: phone_number, post_number: post_number, area_id: area_id, city: city, address: address, building: building, buy_id: buy.id)
  end
end
