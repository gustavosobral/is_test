class Course < ActiveRecord::Base
  has_many :classrooms, dependent: :destroy
  has_enumeration_for :status, with: Status

  validates :name,        presence: true, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 45 }
end
