class Student < ActiveRecord::Base
  has_many :classrooms
  has_enumeration_for :status, with: Status

  validates :name,            presence: true, length: { maximum: 45 }
  validates :register_number, presence: true, length: { maximum: 45 }
end
