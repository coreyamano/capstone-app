class OrderedItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :check, optional: true
  belongs_to :tab
end
