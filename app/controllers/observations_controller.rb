class ObservationsController < ApplicationController

  def new
    @experiment = Experiment.find_by_id(params[:experiment_id])
    @observation = @experiment.observations.new
  end

  def destroy
    @experiment = Experiment.find_by_id(params[:experiment_id])
    @observation = Observation.find_by_id(params[:id])
    @observation.destroy
    redirect_to @experiment
  end

  def create
    # binding.pry
    @experiment = Experiment.find_by_id(params[:experiment_id])
    @observation = @experiment.observations.new(observation_params)
    if @observation.save
      redirect_to @experiment
    else
      @errors = @observation.errors.full_messages
      render :new
    end
  end

  private

  def observation_params
    params.require(:observation).permit(:body)
  end

end
