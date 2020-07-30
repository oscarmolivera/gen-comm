class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[edit update]
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

  def edit; end

  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
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
