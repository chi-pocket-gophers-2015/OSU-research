class ProposalsController < ApplicationController
  def index
    render :proposals
  end

  def new
    render :new
  end
end
