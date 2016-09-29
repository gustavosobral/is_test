class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :course,  presence: true
  validates :student, presence: true
end
