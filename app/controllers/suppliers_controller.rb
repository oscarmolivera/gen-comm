class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[edit update destroy]
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]
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

  def destroy
    @supplier.destroy
    respond_to { |format| format.js }
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :email, :address, :telephone, :photo)
  end

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end 
end
