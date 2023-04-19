class User < ApplicationRecord
  rolify

  after_create :assign_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :image          

  private
  def assign_default_role
    self.add_role(:customer) if self.roles.blank?
  end
end
