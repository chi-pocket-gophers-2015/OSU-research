class CategoriesController < ApplicationController
  def index
    render :category_index
  end

  def show
    @category = Category.find_by_id(params[:id])
    @proposals = @category.proposals.all
    render :category_show
  end

end
