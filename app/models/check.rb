class Check < ApplicationRecord
  has_many :ordered_items
  belongs_to :user
  has_many :products, through: :ordered_items
end
