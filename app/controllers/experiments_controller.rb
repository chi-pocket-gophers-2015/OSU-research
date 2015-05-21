class ExperimentsController < ApplicationController

  def show
    @experiment = Experiment.find_by_id(params[:id])
  end

  def new
    @proposal = Proposal.find_by_id(params[:proposal_id])
    @user = current_user
    if !check_if_faculty
      @experiment = @proposal.experiments.new
    else
      @errors = ["Only staffers can start an experiment"]
      redirect_to user_path(@user)
    end
  end

  def create
    @experiment = current_user.experiments.new(experiment_params)
    if @experiment.save
      redirect_to @experiment
    else
      # binding.pry
      @errors = @experiment.errors.full_messages
      render :new
    end
  end

  # def update
  #   @experiment =
  # end

  private

  def experiment_params
    params.require(:experiment).permit(:proposal_id, :title, :results, :conclusion, :procedure)
  end



end
