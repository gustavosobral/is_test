class Classroom < ActiveRecord::Base
  belongs_to :student, counter_cache: true
  belongs_to :course,  counter_cache: true

  validate  :classroom_uniqueness
  validates :course,  presence: true
  validates :student, presence: true

  def classroom_uniqueness
    if Classroom.exists?(student_id: student_id, course_id: course_id)
      errors.add(:base, 'Essa matrícula já foi realizada')
    end
  end
end
