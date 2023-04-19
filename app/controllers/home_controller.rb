class HomeController < ApplicationController
  def index
    @product = Product.all
  end
end
