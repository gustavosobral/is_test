class Classroom < ActiveRecord::Base
  belongs_to :student, counter_cache: true
  belongs_to :course,  counter_cache: true

  validates :course,  presence: true
  validates :student, presence: true
end
