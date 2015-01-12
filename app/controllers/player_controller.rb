class PlayerController < ApplicationController
	before_filter :set_selected
	
	def index
		@games = Game.all
		@users = User.all
	end

	private
		def set_selected
			params[:nav_action] = 'player'
		end
end