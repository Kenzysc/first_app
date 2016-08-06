class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    user_name = User.find_by_name(params[:session][:name])

    if (user == user_name) && (!user_name.blank?)
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new' 
    end
  end

  def destroy
  end
end
