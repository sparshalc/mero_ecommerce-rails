class ApplicationController < ActionController::Base
        before_action :authenticate_user!
        before_action :set_search
    
        def set_search
            @q = Product.ransack(params[:q])
        end
end
