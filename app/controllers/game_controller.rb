class GameController < ApplicationController
	before_filter :get_games, :set_selected
	def index
		params[:nav_action] =='games'
	end

	def new
	end

	def show
		begin
			@game = Game.find(params[:id])

			@scores = Score.where(game_id: params[:id]).order(created_at: :desc)
			@users = User.all.order(:username)
			if signed_in?

				@users_with_shift = User.all.order(:username).to_a
				@users_with_shift.unshift User.new()
				
				@users_without_current = User.where('id != ?', current_user.id).order(:username).to_a
				@users_without_current.unshift User.new()
			end
		rescue => error
			Rails.logger.error(error)
			redirect_to root_path
		end
	end

	def create
		game = Game.new(
			game: params[:game][:game],
			user_id: current_user.id,
			game_type: params[:game][:game_type]
			)
		if game.save
			flash[:notice] = 'Save success'
			redirect_to game_show_path(game.id)
		else
			flash[:notice] = "Save Failed, make sure name is unique"
			redirect_to game_new_path
		end
	end

	private
		def set_selected
			params[:nav_action] = 'game'
		end
		
		def get_games
			@games = Game.all
		end
end