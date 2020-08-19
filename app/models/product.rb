class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :sale_details
  has_many :warehouse_records

  has_one_attached :picture

  # If no picture is stored for product, show a default one.
  def show_picture
    picture.present? ? picture : 'no_image_available.svg'
  end
end
