class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :purchase_price
      t.integer :amount
      t.integer :production_statu
      

      t.timestamps
    end
  end
end
