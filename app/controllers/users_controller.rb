class UsersController < ApplicationController
	def index
		@users=User.all
	end

	def new
		@user = User.new
	end

	# create user
	def create
		@user = User.new(user_params)
		
		# checks the passwords
		if params[:user][:password] != params[:user][:password_confirmation]
    	flash[:alert] = "Sorry! The passwords did not match"
			redirect_to :back
		# creates the new user
		else @user.save
			flash[:notice] = "Welcome to KimPad"
			log_in(@user) #login the user
			redirect_to root_path #return to home
		end
	end

	# delete user's account
	def destroy
		puts "DESTROY"
		puts "id is #{params[:id]}"
		@user=User.find(params[:id])
		@user.destroy
		session.clear
		flash[:notice] = "Account deleted!"
		redirect_to districts_path
	end

	def show
		@user=User.find(params[:id])
	end

	def edit
		@user=User.find(params[:id])
	end

	# update user account
	def update
		@user=User.find(params[:id])
		if params[:user][:password] != params[:user][:password_confirmation]
    	flash[:alert] = "Sorry! The passwords did not match"
			redirect_to :back
		else @user.update(user_params)
			flash[:notice] = "Account Updated"
			redirect_to user_path(current_user.id)
		end
	end

	# strong parameters
	private
	def user_params
		params.require(:user).permit(:fname, :lname, :email, :password, :avatar, :username)
	end
end
