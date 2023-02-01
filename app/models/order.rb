class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_received_status: { p_wait: 0, p_done: 1, making: 2, s_wait: 3, s_done: 4 },_default: "p_wait"

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

  def subtotal
    item.with_tax_price * amount
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
