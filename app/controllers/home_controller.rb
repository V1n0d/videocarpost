class HomeController < ApplicationController
	before_filter :authenticate_user!, :except => [:display]
  def index
  end

  def display
    @user = User.find(params[:id])
  end

  #Handles Paypal response and validation
  def handle_response
  	if params[:st]=="Completed"
    	current_user.can_upload = current_user.can_upload.to_i+3
    	current_user.save
  		payment = Payment.create(
	  							:user_id => current_user.id,
	  							:status => params[:st],
	  							:transaction_id => params[:tx],
	  							:amount => params[:amt]
  							)
  	else
  		redirect_to paypal_error_path
  	end
  end

  #Handles paypal error message display
  def paypal_error

  end	

  def about_us

  end 

  def contact_us

  end 

  def faq

  end 


end
