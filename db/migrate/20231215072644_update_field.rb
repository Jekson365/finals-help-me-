class UpdateField < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests,:actual_lecture_hours
    add_column :requests,:actual_lecture_hours,:string
  end
end
