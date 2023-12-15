class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|

      t.integer :request_code
      t.datetime :date
      t.integer :client_id
      t.integer :subject_id
      t.integer :lecturer_id
      t.datetime :lecture_start
      t.datetime :lecture_end
      t.datetime :actual_lecture_hours

      t.timestamps
    end
  end
end
