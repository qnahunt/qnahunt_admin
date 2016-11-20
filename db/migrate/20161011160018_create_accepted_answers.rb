class CreateAcceptedAnswers < ActiveRecord::Migration
  def change
    create_table :accepted_answers do |t|
      t.references :answer, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :up_count
      t.integer :down_count

      t.timestamps
    end
  end
end
