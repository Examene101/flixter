class LessonsController < ApplicationController
	def show
	end

	private
	# load current lesoon
	helper_method :current_lesson
    def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
