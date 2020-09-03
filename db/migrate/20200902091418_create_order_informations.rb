class CreateOrderInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :order_informations do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :count, null: false
      t.integer :price, null: false
      t.integer :status, default:0, null: false

      t.timestamps
    end
  end
end
