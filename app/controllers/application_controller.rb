class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :profile_pic, :contact_number)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :profile_pic, :contact_number, :current_password)
    end
  end


  def is_email_avail
    user = User.find_by_email(register_params[:email])
    if current_user
      if user == current_user
        if user
          status = false
        else
          status = true
        end
      end
    else
      if user
        status = true
      else
        status = false
      end
    end
    respond_to do |format|
      if user
        format.json { render :json =>  { :status => status }}
      else
        format.json { render :json => { :status => status }}
      end
    end
  end
  def is_username_avail
    user = User.find_by_user_name(register_params[:username])
    if current_user
      if user == current_user
        if user
          status = false
        else
          status = true
        end
      end
    else
      if user
        status = true
      else
        status = false
      end
    end
    respond_to do |format|
      if user
        format.json { render :json =>  { :status => status }}
      else
        format.json { render :json => { :status => status }}
      end
    end
  end
  def register_params
    params.permit(:email,:username)
  end

end
