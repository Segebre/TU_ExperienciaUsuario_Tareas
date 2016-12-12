class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    email = params[:session][:email]
    passw = params[:session][:password]

    @user = User.find_by_email(email)

    if @user && @user.authenticate(passw)
      login(@user)
    else
      redirect_to login_path, flash: { error: "Email o Password incorrecto"}
    end
  end

  def destroy
    logout
  end
end
