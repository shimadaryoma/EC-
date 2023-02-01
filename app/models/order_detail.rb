class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum payment_method: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  
  def subtotal
    purchase_price * amount
  end

end
