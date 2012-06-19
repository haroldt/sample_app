class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Sign in user and redirect to show page
      sign_in user
      redirect_to user
    else
      #error message
      flash.now[:error] = 'Invalid email/password combination' # first attempt
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
