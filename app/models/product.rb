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

  # If no category is associated with the product, send a
  # simple string line, else send the category name.
  def category_name
    category.present? ? category.name : I18n.t('shared.models.no_category')
  end

  # If no supplier is associated with the product, send a
  # simple string line, else send the supplier name.
  def supplier_name
    supplier.present? ? supplier.name : I18n.t('shared.models.no_supplier')
  end
end
