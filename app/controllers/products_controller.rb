class ProductsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize!, only: [:edit, :update, :destroy]

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(params.require(:product).permit(:title, :description, :price))
        @product.user = @current_user
        if @product.save
            redirect_to products_path
          else
            render :new
          end
    end

    
    def index  
        @products = Product.all.order('updated_at DESC')
        respond_to do |format|
            format.html { render }
            format.json { render json: @products }
        end
    end
    

    def show
        id = params[:id]
        @product = Product.find(id)
        @review = Review.new 
    # For the list of answer
        @reviews = @product.reviews.order(created_at: :desc)
    end

    def destroy
        id = params[:id]
        @product = Product.find(id)
        @product.destroy
        redirect_to products_path
    end

    def edit
        id = params[:id]
        @product = Product.find(id)
    end
    
    def update
        id = params[:id]
        @product = Product.find(id)
        if @product.update(params.require(:product).permit(:title, :description, :price))
        redirect_to products_path(@product)
        else 
            render :edit
        end
    end

    def authorize! 
        redirect_to products_path, alert: 'Not Authorized' unless can?(:crud, Product)
    end
end
