class UsersController < ApplicationController
  def show
    redirect_to root_path if !current_user
    @user = current_user
    @proposals = @user.proposals.order('created_at desc')
    @staff_proposals = @proposals.limit(5)
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
