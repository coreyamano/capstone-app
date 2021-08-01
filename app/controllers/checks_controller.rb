class ChecksController < ApplicationController
  def index
    checks = Check.all
    render json: checks.as_json
  end

  def show
    check = Check.find(params[:id])
    render json: check.as_json
  end
end
