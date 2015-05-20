class UsersController < ApplicationController
  def index

  end
  def show
    user = User.find_by_id(params[:id])
    @proposals = user.proposals

    render 'faculty_homepage' if user && user.faculty == true
    render '/user/staffer_homepage' if user && user.faculty == false
  end


end
