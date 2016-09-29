class AddClassroomsCountToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :classrooms_count, :integer
  end
end
