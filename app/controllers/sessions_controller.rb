class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(session_params)
    if @user
      session[:user_id] = @user.id
      redirect_to @user, notice: "You have successfully logged in"
    else
      @errors = ["login info is not valid"]
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end
