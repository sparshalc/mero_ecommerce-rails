class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  
  def total
    product.oriprice.to_i*quantity
  end

end
