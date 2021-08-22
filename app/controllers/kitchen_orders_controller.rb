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
    # tab = []
    # each_items = {}
    # ordered_items.each do |prod|
    #   name = prod[:product_item_name]
    #   customer_note = prod[:customer_note]
    #   time = prod[:submitted_time]
    #   item = { product_item_name: name, customer_note: customer_note, submitted_time: time }
    #   tab << item
    # end
  end

  def update
    ordered_item = OrderedItem.find_by(id: params[:id])
    ordered_item.update(
      status: params[:status],
    )
    render_item = ordered_item.as_json
    render_item["submitted_time"] = ordered_item.updated_at.strftime("%b %e, %l:%M %p")
    render json: render_item
  end
end
