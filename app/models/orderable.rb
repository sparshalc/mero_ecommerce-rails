class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  
  def total
    product.disprice.to_i*quantity
  end

end
