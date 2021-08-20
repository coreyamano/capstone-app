class OrderedItemsController < ApplicationController
  # before_action :authenticate_user

  def index
    ordered_items = OrderedItem.where(user_id: current_user.id, status: "ordered")
    render_items = []
    ordered_items.each do |ordered_item|
      render_item = ordered_item.as_json
      render_item["submitted_time"] = ordered_item.created_at.strftime("%b %e, %l:%M %p")
      render_items << render_item
    end
    render json: render_items
  end

  def create
    ordered_item = OrderedItem.new(
      user_id: current_user.id,
      tab_id: params[:tab_id],
      product_id: params[:product_id],
      product_item_name: Product.where(id: params[:product_id])[0]["item_name"],
      product_menu_category: Product.where(id: params[:product_id])[0]["menu_category"],
      product_price: Product.where(id: params[:product_id])[0]["price"],
      quantity: params[:quantity],
      # subtotal: (Product.where(id: params[:product_id])[0]["price"]) * params[:quantity],
      status: "ordered",
      customer_note: params[:customer_note],
      dining_option: params[:dining_option],
      check_id: params[:check_id],
    )

    if ordered_item.save!
      render_item = ordered_item.as_json
      render_item["submitted_time"] = ordered_item.created_at.strftime("%b %e, %l:%M %p")
      render json: render_item
    else
      render json: { Error: ordered_item.errors.full_message }, status: :unprocessable_entity
    end
  end

  def update
    ordered_item = OrderedItem.find_by(id: params[:id])
    ordered_item.update(
      quantity: params[:quantity] || ordered_item.quantity,
      customer_note: params[:customer_note] || ordered_item.customer_note,
      dining_option: params[:dining_option] || ordered_item.dining_option,
    )
    render_item = ordered_item.as_json
    render_item["submitted_time"] = ordered_item.created_at.strftime("%b %e, %l:%M %p")
    render json: render_item
  end

  def destroy
    ordered_item_id = params[:id]
    ordered_item = OrderedItem.find_by(id: ordered_item_id)
    ordered_item.status = "removed"

    if ordered_item.save
      render json: { message: "You removed this item." }
    else
      render json: { Error: ordered_item.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
