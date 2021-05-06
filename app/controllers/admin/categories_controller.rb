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

  def update
  end

  def destroy
  end

  private
    def category_params
    end
end
