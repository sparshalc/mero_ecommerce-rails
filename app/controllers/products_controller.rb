class ProductsController < ApplicationController
    before_action :set_product,only: [:edit,:update,:view,:destroy, :show]
    def index
        @product = Product.all
    end
    def new
        @product = Product.new
    end
    def create
        @product = Product.create(product_params)
        if @product.save
            redirect_to product_path(@product),notice: 'Product added successfully'
        end
    end
    def show
    end
    def edit
    end
    def update
        if @product.update(product_params)
            redirect_to product_path(@product),notice: 'Product Updated!'
        end
    end
    def destroy
        if @product.destroy
            redirect_to products_path,alert: 'Product Deleted!'
        end
    end

    private
    def product_params
        params.require(:product).permit(:name, :oriprice, :disprice, :brand, :category, :image)
    end
    def set_product
        @product = Product.find_by(id: params[:id])
    end
end
