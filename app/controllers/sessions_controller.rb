class SessionsController < ApplicationController
  def new
    if user_signed_in?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to user
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
