class SalesController < ApplicationController
  before_action :set_sale, only: %i[edit]
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.create(amount: 0.0, user_id: current_user.id)
    redirect_to edit_sale_path(@sale.id)
  end

  def edit
    @products_sale = @sale.sale_details
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end
end
