class KitchenOrdersController < ApplicationController
  def index
    ordered_items = OrderedItem.where(status: "ordered")
    render_items = []
    ordered_items.each do |ordered_item|
      render_item = ordered_item.as_json
      render_item["submitted_time"] = ordered_item.created_at.strftime("%b %e, %l:%M %p")
      render_items << render_item
    end
    render json: render_items
  end
end
