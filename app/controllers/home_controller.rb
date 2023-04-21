class HomeController < ApplicationController
  def index
    @product = Product.limit(4).order("Created_at DESC")
  end
end
