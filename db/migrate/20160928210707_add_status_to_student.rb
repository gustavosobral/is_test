class AddStatusToStudent < ActiveRecord::Migration
  def change
    add_column :students, :status, :int, default: 0
  end
end
