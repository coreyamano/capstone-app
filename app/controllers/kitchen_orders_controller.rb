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
    ordered_items = OrderedItem.where(user_id: current_user.id, status: "in cart")
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
      status: params[:status],
      dining_option: params[:dining_option] || ordered_item.dining_option,
      customer_note: params[:customer_note] || ordered_item.customer_note,
    )
    render_item = ordered_item.as_json
    render_item["submitted_time"] = ordered_item.updated_at.strftime("%b %e, %l:%M %p")
    render json: render_item
  end
end
