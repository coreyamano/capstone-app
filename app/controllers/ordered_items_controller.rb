class OrderedItemsController < ApplicationController
  before_action :authenticate_user

  def index
    ordered_items = OrderedItem.where(user_id: current_user.id, status: "ordered")
    render json: ordered_items.as_json
  end

  def create
    ordered_item = OrderedItem.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "ordered",
      order_id: params[:ordered_id],
    )

    if ordered_item.save
      render json: ordered_item.as_json
    else
      render json: { Error: ordered_ite.errors.full_message }, status: :unprocessable_entity
    end
  end
end
