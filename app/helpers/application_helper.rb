module ApplicationHelper
	def is_selected(id)
		if id == params[:nav_action]
			'selected'
		end
	end
end
