class KitchenTicketsController < ApplicationController
  def index
    ordered_items = OrderedItem.where(status: ["preparing", "completed"])
    the_tabs = []
    the_items = {}
    ordered_items.each do |ordered_item|
      x = ordered_item[:quantity].to_i
      x.times do
        render_item = ordered_item.as_json
        render_item["submitted_time"] = ordered_item.updated_at.strftime("%b %e, %l:%M %p")
        tab = ordered_item[:tab_id]
        ordered_item_id = ordered_item[:id]
        name = ordered_item[:product_item_name]
        customer_note = ordered_item[:customer_note]
        time = render_item["submitted_time"]
        dining_option = ordered_item[:dining_option]
        the_items = { id: ordered_item_id, tab_id: tab, product_item_name: name, customer_note: customer_note, submitted_time: time, dining_option: dining_option }
        the_tabs << the_items
      end
    end
    render json: the_tabs
  end

  def destroy
    ordered_items = OrderedItem.where(status: ["preparing", "completed"])
    the_tabs = []
    the_items = {}
    ordered_items.each do |ordered_item|
      x = ordered_item[:quantity].to_i
      x.times do
        render_item = ordered_item.as_json
        render_item["submitted_time"] = ordered_item.updated_at.strftime("%b %e, %l:%M %p")
        tab = ordered_item[:tab_id]
        name = ordered_item[:product_item_name]
        customer_note = ordered_item[:customer_note]
        status = ordered_item[:status]
        time = render_item["submitted_time"]
        dining_option = ordered_item[:dining_option]
        the_items = { tab_id: tab, product_item_name: name, customer_note: customer_note, submitted_time: time, dining_option: dining_option, status: status }
        the_tabs << the_items
      end
    end
    render json: the_tabs
  end
end
