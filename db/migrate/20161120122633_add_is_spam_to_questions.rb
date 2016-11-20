class AddIsSpamToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :is_spam, :boolean, :default => false
  end
end
