class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    session[:user_id] = @user.id
    @proposals = @user.proposals.order('created_at desc')
    render 'faculty_homepage' if @user && @user.faculty == true
    render 'staffers_homepage' if @user && @user.faculty == false
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.determine_faculty(params[:user][:secret_code])
    if @user.save
      session[:user_id] = @user.id
      @user.faculty ? title = "faculty" : title = "staffer"
      redirect_to @user, notice: "You have successfully created a #{title} account."
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
