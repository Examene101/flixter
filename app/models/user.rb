class User < ActiveRecord::Base
	has_many :courses
	has_many :enrollments
	has_many :enrolled_courses, through: :enrollments, source: :course
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    #check if user is enrolled in course, creat empty array of enrolled courses
    def enrolled_in?(course)
    	return enrolled_courses.include?(course)
    end
end
