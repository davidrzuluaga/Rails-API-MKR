class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session
 
  def index
      @product = Product.all
      render json: @product
  end
    
  def create
    @product = Product.create(product_params)   
    if @product.save
      render json: { product: @product }, status: :created
    else
      render json: { errors: @product.errors }, status: 422
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      render json: @product, status: 200
    else
      render json: { errors: @product.errors }, status: 422
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      render json: @product, status: 204
    end

    head :no_content
  end

private 

  def product_params
    params.require(:product).permit(:name, :price)
  end

end
