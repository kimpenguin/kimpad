class SessionsController < ApplicationController
	def new
		if current_user
      redirect_to root_path
    end
	end
	def create
		@user = User.where(email: params[:session][:email]).first

		# if user exists and the password matches
		if @user && @user.authenticate(params[:session][:password])
			log_in(@user)
			flash[:notice] = "You're logged in!"
			redirect_to user_path(@user)
		elsif @user && !@user.authenticate(params[:session][:password])
			flash[:error] = "wrong password for #{params[:session][:email]}"
			redirect_to :back
		elsif !@user
			flash[:error] = "#{params[:session][:email]} does not exist"
			redirect_to :back
		end
		# redirect_to root_path
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end
