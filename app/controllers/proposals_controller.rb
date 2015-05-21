class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def show
    @proposal = Proposal.find_by_id(params[:id])
  end

  def new
    @user = current_user
    if @user.faculty
      @proposal = @user.proposals.new
      render :new
    else
      @errors = ["I'm sorry, you must have Faculty clearance to create a new proposal"]
      redirect_to user_path(@user)
    end
  end

  def create
    @user = current_user
    @proposal = @user.proposals.new(proposal_params)
    if @proposal.save
      redirect_to @user
    else
      # binding.pry
      @errors = @proposal.errors.messages
      render :new
    end
  end


  private

  def proposal_params
    params.require(:proposal).permit(:title, :hypothesis, :summary)
  end
end
