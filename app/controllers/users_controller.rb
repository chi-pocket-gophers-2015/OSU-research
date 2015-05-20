class UsersController < ApplicationController
  def index

  end
  def show
    user = User.find_by(id: params[:id])
    render 'faculty_homepage' if user && user.faculty == true
    render 'staffer_homepage' if user && user.faculty == false
  end

end
