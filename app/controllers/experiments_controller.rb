class ExperimentsController < ApplicationController

  def show
    @experiment = Experiment.find_by_id(params[:id])
  end

  def new
    @user = current_user


  end

  def create

  end

  def update

  end



end
