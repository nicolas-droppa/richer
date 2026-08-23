class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])
    
    if user
      session[:current_user_id] = user.id

      redirect_to root_url, notice: 'Login successful.'
    else
      flash.now.alert = 'Incorrect email or password.'

      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete :current_user_id

    redirect_to root_url, notice: 'Logout successful.'
  end
end
