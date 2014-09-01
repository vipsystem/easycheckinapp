class SessionsController < ApplicationController
	
  def new
    if signed_in?
      redirect_to doctors_path
    end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to doctors_path
    else
      # flash.now[:error] = 'Try again...Invalid email/password'
      render 'new'
    end
	end

  def destroy
  sign_out
  redirect_to root_url
  end

  def user
    @user = User.new
  end
end
