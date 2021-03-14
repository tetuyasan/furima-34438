class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table    :items do |t|
      t.integer     :item_price,            null: false
      t.string      :item_name,             null: false, default: ""
      t.references  :user,                  foreign_key: true
      t.integer     :category_id,           null: false
      t.text        :comment,               null: false
      t.integer     :condition_id,          null: false
      t.integer     :shipping_id,           null: false
      t.integer     :shipping_charge_id,    null: false
      t.integer     :area_id,               null: false

      t.timestamps
    end
  end
end
