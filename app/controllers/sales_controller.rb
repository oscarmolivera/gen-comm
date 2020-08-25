class SalesController < ApplicationController
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
end
