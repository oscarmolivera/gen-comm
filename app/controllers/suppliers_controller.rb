class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    respond_to do |format|
      if @supplier.save
        format.js
      else
        format.js { render :new, status: :method_not_allowed }
      end
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :email, :address, :telephone, :photo)
  end

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end
