class BuySend
  include ActiveModel::Model
  attr_accessor :name, :post_number, :area_id, :city, :address, :building, :phone_number, :user_id

  with_options presence: true do
    validates :area_id
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11}
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  end

  def save
    order = Order.create(price: price, user_id: user_id)
    Address.create(post_number: post_number, area_id: area_id, city: city, address: address, building: building, order_id: order_id)
  end
end
