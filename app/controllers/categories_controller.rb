class CategoriesController < ApplicationController
  def mens_fashion
    @product = Product.where(:category => 2).order("created_at DESC")  
  end
  def womens_fashion
    @product = Product.where(:category => 1).order("created_at DESC")  
  end

  def electronics
    @product = Product.where(:category => 3).order("created_at DESC")  
  end

  def other
    @product = Product.where(:category => 4).order("created_at DESC")  
  end
end

