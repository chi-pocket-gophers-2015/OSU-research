class ProposalsController < ApplicationController

  def new
    # binding.pry
    @user = User.find_by_id(session[:user_id])
    @proposal = @user.proposals.new
    render :new
  end

  def create
    @user = User.find_by_id(session[:user_id])
    @proposal = @user.proposals.new(proposal_params)
    if @proposal.save
      redirect_to @user
    else
      @errors = @proposal.errors.messages
      render :new
    end
  end


  private

  def proposal_params
    params.require(:proposal).permit(:title, :hypothesis, :summary, :status)
  end
end
