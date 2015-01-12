class TalliiController < ApplicationController
	before_filter :requires_login, only: [:index]
	def index
		render 'index'
	end

	def authenticate
		unless signed_in?
			render 'authenticate'
		else
			redirect_to root_path
		end
	end
end