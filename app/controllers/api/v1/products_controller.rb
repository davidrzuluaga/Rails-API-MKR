class Api::V1::ProductsController < ApplicationController
    protect_from_forgery with: :null_session

  def index
    @product = Product.all
    render json: @product
  end
end
