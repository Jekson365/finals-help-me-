class CreateQuestionss < ActiveRecord::Migration[7.0]
  def change
    create_table :questionsses do |t|
      t.string :question
      t.timestamps
    end
  end
end
