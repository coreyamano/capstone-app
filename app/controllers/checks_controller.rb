class ChecksController < ApplicationController
  # before_action :authenticate_user

  def index
    checks = Check.where(user_id: current_user.id, status: "open")
    render json: checks.as_json
  end

  def create
    #figure out which carted_products are in the shopping cart
    ordered_items = OrderedItem.where(user_id: current_user.id, status: ["preparing", "completed"])
    # find out how much each of them cost
    calculated_subtotal = 0
    calculated_tax = 0
    ordered_items.each do |item|
      calculated_subtotal += item.product.price * item.quantity
      calculated_tax += item.product.tax * item.quantity
    end

    # add that all together
    # tax + total
    #save the order
    check = Check.new(
      user_id: current_user.id,
      status: "open",
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_subtotal + calculated_tax,
    )

    check.save
    # go back and update the carted_products with the order id
    ordered_items.each do |item|
      item.update(check_id: check.id,
                  status: "checking out")
    end
    render json: check.as_json
  end

  def update
    check = Check.find_by(id: params[:id])
    check.update(
      status: "closed",
    )
    ordered_items = OrderedItem.where(user_id: current_user.id, status: "checking out")
    ordered_items.each do |item|
      item.update(
        status: "paid",
      )
    end
    render json: check.as_json
  end
end
