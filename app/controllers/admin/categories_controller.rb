class Admin::CategoriesController < ApplicationController
  before_action :admin_log_in

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success]="Saved successfully!"
      redirect_to admin_categories_url
    else
      flash[:danger]="Invalid content. Try again"
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success]= "Save successfully!"
       redirect_to admin_categories_url
    else
      flash[:danger] = "Invalid content. Try again."
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_url
  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end
end
