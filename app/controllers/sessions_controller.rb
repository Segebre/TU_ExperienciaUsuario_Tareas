class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
    if current_user
      redirect_to posts_path
    end
  end

  def create
    email = params[:session][:email]
    passw = params[:session][:password]

    @char = Character.find_by_email(email)

    if @char && @char.authenticate(passw)
      login(@char)
    else
      redirect_to login_path, flash: { error: "Email o Password incorrecto"}
    end
  end

  def destroy
    logout
  end
end
