class KitchenTicketsController < ApplicationController
  def index
    ordered_items = OrderedItem.where(status: ["preparing", "completed"]).order(status: :asc, created_at: :asc)
    render_items = []
    ordered_items.each do |ordered_item|
      render_item = ordered_item.as_json
      render_item["submitted_time"] = ordered_item.created_at.strftime("%b %e, %l:%M %p")
      render_items << render_item
    end
    sorted_render_items = render_items
    render json: sorted_render_items
  end
end
