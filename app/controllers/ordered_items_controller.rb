class OrderedItemsController < ApplicationController
  # before_action :authenticate_user

  def index
    ordered_items = OrderedItem.where(user_id: current_user.id, status: "ordered")
    # purchased_items = OrderedItem.where(user_id: current_user.id, status: "purchased")
    render json: ordered_items.as_json
  end

  def create
    ordered_item = OrderedItem.new(
      user_id: current_user.id,
      tab_id: params[:tab_id],
      product_id: params[:product_id],
      product_item_name: Product.where(id: params[:product_id])[0]["item_name"],
      product_menu_category: Product.where(id: params[:product_id])[0]["menu_category"],
      quantity: params[:quantity],
      status: "ordered",
      dining_option: params[:dining_option],
      check_id: params[:check_id],
    )

    if ordered_item.save
      render json: ordered_item.as_json
    else
      render json: { Error: ordered_item.errors.full_message }, status: :unprocessable_entity
    end
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
