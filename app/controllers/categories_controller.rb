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
        format.js { render :new, status: :Not_Acceptable }
      end
    end
  end

end
