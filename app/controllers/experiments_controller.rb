class ExperimentsController < ApplicationController

  def show
    @experiment = Experiment.find_by_id(params[:id])
  end

  def new
    @user = current_user
    if @user.staffer
      @experiment = @user.experiments.new
    else
      @errors = ["Only staffers can start an experiment"]
      redirect_to user_path(@user)
    end
  end

  def create
    @experiment = current_user.experiments.new(experiment_params)
    if @experiment.save
      redirect_to @user
    else
      # binding.pry
      @errors = @experiment.errors.messages
      render :new
    end
  end

  def update

  end

  private

  def experiment_params
    params.require(:experiment).permit( :title, :results, :conclusion, :procedure)
  end



end
