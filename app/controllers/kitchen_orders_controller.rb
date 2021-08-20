class KitchenOrdersController < ApplicationController
  def index
    ordered_items = OrderedItem.where(status: "preparing")
    render_items = []
    ordered_items.each do |ordered_item|
      render_item = ordered_item.as_json
      render_item["submitted_time"] = ordered_item.updated_at.strftime("%b %e, %l:%M %p")
      render_items << render_item
    end
    render json: render_items
  end

  def create
    ordered_items = OrderedItem.where(user_id: current_user.id, status: "ordered")
    ordered_items.each do |item|
      item.update(
        status: "preparing",
        dining_option: params[:dining_option],
      )
    end
  end

  def update
    ordered_item = OrderedItem.find_by(id: params[:id])
    ordered_item.update(
      status: params[:dining_option] || ordered_item.status,
    )
    render_item = ordered_item.as_json
    render_item["submitted_time"] = ordered_item.updated_at.strftime("%b %e, %l:%M %p")
    render json: render_item
  end
end
