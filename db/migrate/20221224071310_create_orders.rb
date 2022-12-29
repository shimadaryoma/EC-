class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name 
      t.integer :total_payment
      t.integer :payment_method 
      t.integer :order_received_status
      t.string :postage
      
      

      t.timestamps
    end
  end
end
