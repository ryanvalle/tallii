class UserController < ApplicationController
	def create
		user = User.new
		user.username = params[:user][:username]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_digest]
		user.displayname = params[:user][:displayname]
		user.remember_token = SecureRandom.urlsafe_base64
		if user.save
			sign_in(user)
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def show
		redirect_to root_path if params[:id].blank?
		@user = User.find(params[:id])
		@games = Game.all
	end

	def update
	end

	def login
		user = User.find_by_username(params[:user][:username])
		if user && user.authenticate(params[:user][:password])
			flash[:success] = "Login Success"
			sign_in(user)
			redirect_to root_path
		else
			flash[:danger] = "Invalid username/password"
			sign_out
			redirect_to root_path
		end
	end

	def logout
		sign_out
		redirect_to root_path
	end
	private

end