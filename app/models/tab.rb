class Tab < ApplicationRecord
  has_many :ordered_items
  has_many :checks
end
