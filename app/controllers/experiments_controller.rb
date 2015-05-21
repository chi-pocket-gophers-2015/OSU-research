class ExperimentsController < ApplicationController
  def show
    @experiment = Experiment.find_by_id(params[:id])
  end
end
