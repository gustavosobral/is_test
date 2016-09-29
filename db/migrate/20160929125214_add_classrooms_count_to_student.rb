class AddClassroomsCountToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classrooms_count, :integer
  end
end
