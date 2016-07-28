class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    user_name = User.find_by_name(params[:session][:name])

    if (user == user_name) && (!user_name.blank?)
      # Sign the user in and redirect to the users show page
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new' 
    end
  end

  def destroy
  end
end
