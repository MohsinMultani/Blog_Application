class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
        if user.email.confirmed 
          session[:user_id] = user.id
          redirect_to blogs_url
         else
          flash[:error] = 'please activate your Account.'
        end
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
