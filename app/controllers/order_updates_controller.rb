class OrderUpdatesController < ApplicationController
  def index
    ordered_items = OrderedItem.where(status: ["preparing", "completed"])
    render_items = []
    ordered_items.each do |ordered_item|
      render_item = ordered_item.as_json
      render_item["submitted_time"] = ordered_item.created_at.strftime("%b %e, %l:%M %p")
      render_items << render_item
    end
    sorted_render_items = render_items.sort_by { |render_item| render_item["submitted_time"] }
    render json: sorted_render_items
  end
end
