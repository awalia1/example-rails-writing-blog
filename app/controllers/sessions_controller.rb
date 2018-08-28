class SessionsController < ApplicationController
  #authentication => You are who you say you are
  #authorization => What privileges does this person have? 
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_path
    else
      msg = "Invalid Credentials"
      render 'new'
    end
  end

  def destroy
    
  end

end
