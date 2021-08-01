class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find(params[:id])
    render json: product.as_json
  end

  def create
    product = Product.new(
      item_name: params[:item_name],
      description: params[:description],
      menu_category: params[:menu_category],
      price: params[:price],
      availability: params[:availability],
      image: params[:image],
    )
    if product.save
      render json: product.as_json
    else
      render json: { Error: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # update, delete to be created later
end
