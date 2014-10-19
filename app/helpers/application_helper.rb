module ApplicationHelper

	def indicator_icon(location)
		if location.is_passed?
			" indicator-icon-active-green"
		end
	end
end
