class ProductsController < ApplicationController
    before_action :set_product,only: [:view,:destroy, :show]
    before_action :correct_user,only: [:edit,:update,:destroy]
    before_action :set_search



    def index
        @product = Product.all
        @q = Product.ransack(params[:q])
        @product = @q.result(distinct: true)
    end
    def new
        @product = Product.new
    end
    def create
        @product = Product.create(product_params)
        if @product.save
            redirect_to product_path(@product),notice: 'Product added successfully'
        else
            render :new,status: :bad_request
        end
    end
    def show
        @product.update(views: @product.views + 1)
        @comment = @product.comments.order('Created_at DESC')

    end
    def edit
        @product = Product.find_by(id: params[:id])
    end
    def update
        @product = Product.find_by(id: params[:id])
        if @product.update(product_params)
            redirect_to product_path(@product),notice: 'Product Updated!'
        else
            render :edit,status: :bad_request
        end
    end
    def destroy
        if @product.destroy
            redirect_to root_path,alert: 'Product Deleted!'
        end
    end

    private
    def correct_user
        @product = current_user.products.find_by(id: params[:id])
        unless current_user.has_role?(:admin) || @product.nil?
            redirect_to root_path,alert: 'Not Authorized!'
        end
    end
    def product_params
        params.require(:product).permit(:name, :oriprice, :disprice, :brand, :category, :image, :user_id)
    end
    def set_product
        @product = Product.find_by(id: params[:id])
    end
end
