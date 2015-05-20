class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    session[:user_id] = @user.id
    render 'user/faculty_homepage' if @user && @user.faculty == true
    render 'user/staffer_homepage' if @user && @user.faculty == false
  end

end
