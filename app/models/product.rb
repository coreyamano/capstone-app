class Product < ApplicationRecord
  has_many :ordered_items
  has_many :checks, through: :ordered_items
end
