class Api::V1::ProductsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @product = Product.all
        render json: @product
    end

    def create
        @product = Product.create(product_params)   
        if @product.save
          render json: @product
        else
          render json: { errors: @product.errors }, status: 422
        end
    end

    private

    def product_params
      params.require(:product).permit(:name, :price)
    end
end
