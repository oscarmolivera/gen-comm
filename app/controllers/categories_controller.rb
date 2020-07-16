class CategoriesController < ApplicationController
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

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
