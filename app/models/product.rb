class Product < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "name", "updated_at"]
      end
      def self.ransackable_associations(auth_object = nil)
        []
      end
    
    belongs_to :user
    has_one_attached :image
    has_many :comments,dependent: :destroy


end
