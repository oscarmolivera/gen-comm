class SalesController < ApplicationController
  before_action :set_sale, only: %i[edit]
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.create(amount: 0.0)
    redirect_to edit_sale_path(@sale)
  end

  def edit
    @products_sale = @sale.sale_details
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end
end
