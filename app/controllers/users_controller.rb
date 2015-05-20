class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    render 'faculty_homepage' if @user && @user.faculty == true
    render 'staffer_homepage' if @user && @user.faculty == false
  end

  def new
    @user = User.new
  end

end
