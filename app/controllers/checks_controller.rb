class ChecksController < ApplicationController
  before_action :authenticate_user

  def index
    checks = Check.where(user_id: current_user.id)
    render json: checks.as_json
  end

  def create
    #figure out which carted_products are in the shopping cart
    ordered_items = current_user.ordered_items.where(status: "ordered")
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
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_subtotal + calculated_tax,
    )

    check.save
    # go back and update the carted_products with the order id
    ordered_items.each do |item|
      item.update(status: "purchased", check_id: check.id)
    end
    render json: check.as_json
  end
end
