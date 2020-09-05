class Api::V1::ProductsController < ApplicationController
    def index  
        products = Product.all.order('updated_at DESC')
        render json: products
    end

    def show
        product = Product.find(params[:id])
        render json: product
    end
end
