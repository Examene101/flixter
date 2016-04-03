class Course < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :sections
	has_many :enrollments

	validates :title, presence: true
    validates :description, presence: true
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

    #allow user to bypass credit information if course is free
    def free?
    	cost.zero?
    end

    #determine if course in not free
    def premium?
    	! free?
    end
end