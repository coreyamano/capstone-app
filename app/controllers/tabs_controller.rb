class TabsController < ApplicationController


  def index
    tabs = Tab.all
    render json: tabs.as_json
  end

  def show
    tab = Tab.find(params[:id])
    render json: tab.as_json
  end

  def create
    tab = Tab.new(
      tab_name: params[:tab_name],
    )
    if tab.save
      render json: tab.as_json
    else
      render json: { Error: tab.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
