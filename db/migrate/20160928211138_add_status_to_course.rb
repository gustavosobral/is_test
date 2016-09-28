class AddStatusToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :status, :int, default: 0
  end
end
