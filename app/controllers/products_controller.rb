class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]

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

  private

  def product_params
    params.require(:product).permit(:name, :description, :existence, :price, :image, :category_id, :supplier_id)
  end
end
