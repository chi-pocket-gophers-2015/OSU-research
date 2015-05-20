class UserController < ApplicationController
  def show
    user = User.find(params[:id])
    render 'faculty_homepage' if user.faculty==true
  end

end
