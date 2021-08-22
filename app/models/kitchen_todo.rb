class KitchenTodo < ApplicationRecord
  belongs_to :product
  belongs_to :tab, optional: true
end
