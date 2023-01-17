class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_
      t.integer :purchase_price
      t.integer :amount
      t.integer :production_statu
      

      t.timestamps
    end
  end
end
