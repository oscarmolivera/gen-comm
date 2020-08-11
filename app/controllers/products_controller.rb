class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  before_action :set_product, only: %i[edit]
  before_action :set_category, only: %i[edit]
  before_action :set_supplier, only: %i[edit]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.js
      else
        format.js { render :new, status: :unauthorized }
      end
    end
  end

  def edit; end

  private

  def product_params
    params.require(:product).permit(:name, :description, :existence, :price, :image, :category_id, :supplier_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category = Category.all
  end

  def set_supplier
    @supplier = Supplier.all
  end
end
