class EnrollmentsController < ApplicationController
	before_action :authenticate_user!
    

    # create enrollment with current user redirect to course page 
	def create
		current_user.enrollments.create(course: current_course)
		redirect_to course_path(current_course)
	end

	private


    #find current course by id
	def current_course
		@current_course ||= Course.find(params[:course_id])
	end
end
