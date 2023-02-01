class Item < ApplicationRecord
  has_many :cart_item, dependent: :destroy
  has_many :order_detail, dependent: :destroy
  belongs_to :genre
  has_one_attached :image
  
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  
  def with_tax_price
    (price * 1.1).floor
  end
  

end
