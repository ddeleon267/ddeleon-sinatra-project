class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_products
  has_many :products, through: :routine_products
  validates :name, :products, :description, presence: true
end
