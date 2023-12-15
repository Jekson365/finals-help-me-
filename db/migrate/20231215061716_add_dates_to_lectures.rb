class AddDatesToLectures < ActiveRecord::Migration[7.0]
  def change
    add_column :lectures,:lecture_start,:datetime
    add_column :lectures,:lecture_end,:datetime
    add_column :lectures,:subject_id,:integer
  end
end
