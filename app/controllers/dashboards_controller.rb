class DashboardsController < ApplicationController
	#authenticate user before access to page
	before_action :authenticate_user!
	
	def show 
	end

end
