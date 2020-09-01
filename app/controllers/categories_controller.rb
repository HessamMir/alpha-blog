class CategoriesController < ApplicationController
 
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "you have successfully created a new category"
      redirect_to @category

    else
      render 'new'
  end

  def index
    
  end

  def show
    @category = Category.find(params[:id])
  end

  
end

  private 

  def category_params
    params.require(:category).permit(:name)
    
  end
  
end