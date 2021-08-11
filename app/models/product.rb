class Product < ApplicationRecord
  has_many :ordered_items
  has_many :checks, through: :ordered_items

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
