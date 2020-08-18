class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :sale_details
  has_many :warehouse_records

  has_one_attached :picture
end
