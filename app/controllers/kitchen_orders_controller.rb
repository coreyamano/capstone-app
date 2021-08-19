class KitchenOrdersController < ApplicationController

  def index
    ordered_items = OrderedItem.where(status: "ordered")
    # purchased_items = OrderedItem.where(user_id: current_user.id, status: "purchased")
    render json: ordered_items.as_json
  end

end
