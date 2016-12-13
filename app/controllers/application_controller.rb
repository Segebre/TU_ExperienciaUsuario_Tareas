class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :belongsToMe

  def login(user)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def current_user
    if session[:user_id]
      @current_user = Character.find(session[:user_id])
    end
  end
  
  def belongsToMe(param)
    if(current_user && current_user.id==param.character_id || current_user && current_user.email=="system@heroe.com")
      true
    else
      false
    end
  end
end
