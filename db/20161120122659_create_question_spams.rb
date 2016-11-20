class CreateQuestionSpams < ActiveRecord::Migration[5.0]
  def change
    create_table :question_spams do |t|
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
