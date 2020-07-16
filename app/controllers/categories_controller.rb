class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.js
      else
        format.js { render :new, status: :method_not_allowed }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.js
      else
        format.js { render :new, status: :method_not_allowed }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
