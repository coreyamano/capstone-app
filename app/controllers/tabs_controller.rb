class TabsController < ApplicationController


  def index
    tabs = Tab.all
    render json: tabs.as_json
  end

  def show
    tab = Tab.find(params[:id])
    render json: tab.as_json
  end

end
