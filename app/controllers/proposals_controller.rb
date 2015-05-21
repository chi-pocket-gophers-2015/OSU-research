class ProposalsController < ApplicationController

  def show
    @proposal = Proposal.find_by_id(params[:id])
  end

  def new
    # binding.pry
    @user = User.find_by_id(session[:user_id])
    if @user.faculty
      @proposal = @user.proposals.new
      render :new
    else
      @errors = ["I'm sorry, you must have Faculty clearance to create a new proposal"]
      redirect_to user_path(@user)
    end
  end

  def create
    @user = User.find_by_id(session[:user_id])
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
