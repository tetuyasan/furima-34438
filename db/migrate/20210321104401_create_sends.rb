class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.integer :area_id,           null: false
      t.string :post_number,        null: false, default: ""
      t.string :city,               null: false, default: ""
      t.string :address,            null: false, default: ""
      t.string :building
      t.string :phone_number,       null: false, default: ""
      t.references :buy,            foreign_key: true
      t.timestamps
    end
  end
end
