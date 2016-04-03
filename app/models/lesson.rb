class Lesson < ActiveRecord::Base
	belongs_to :section
	mount_uploader :video, VideoUploader


	include RankedModel

	#order lesson with same section id
	ranks :row_order, :with_same => :section_id
end
