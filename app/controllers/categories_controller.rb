class CategoriesController < ApplicationController
  def index
    render :index
  end

  def show
    @category = Category.find_by_id(params[:id])
    @proposals = @category.proposals.all
    render :show
  end
end
