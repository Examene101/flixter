class Lesson < ActiveRecord::Base
	belongs_to :section
	mount_uploader :video, VideoUploader


	include RankedModel

	#order lesson with same section id
	ranks :row_order, :with_same => :section_id

	def next_lesson
		# look for section of lesson filter out lesson not ahter current lesson in section
		lesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first
		# if next lesson black move to next section
		if lesson.blank? && section.next_section
          return section.next_section.lessons.rank(:row_order).first
        end

		return lesson
	end
end
