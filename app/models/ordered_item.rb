class OrderedItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :check, optional: true
  belongs_to :tab

  def item_name
    product_item_name = Product.where(id: params[:product_id])[0]["item_name"]
  end
end
