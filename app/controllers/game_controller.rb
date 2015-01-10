class GameController < ApplicationController
	def index
		params[:nav_action] =='games'
	end
end