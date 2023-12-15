class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
