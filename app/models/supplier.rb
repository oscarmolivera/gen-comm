class Supplier < ApplicationRecord
  has_many :products
  has_many :warehouse_records

  validates :name, :email, :address, :telephone, :photo, presence: true

end
