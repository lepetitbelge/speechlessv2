class Admin::CategoriesController < ApplicationController
  before_action :find_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_category_path(@category)
      flash[:notice] = 'Nice! Category successfully created!'
    else
      flash[:alert] = 'Oops! Something went wrong, category could not be created!'
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(@category)
      flash[:notice] = 'Nice! Category successfully updated!'
    else
      flash[:alert] = 'Oops! Something went wrong, category could not be updated!'
      render :edit
    end
  end

  def delete
    if @category.destroy
      redirect_to admin_categories_path
      flash[:notice] = 'Nice! Category successfully deleted!'
    else
      flash[:alert] = 'Oops! Something went wrong, category could not be deleted!'
      render :show
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
