class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :task
      t.string :action
      t.integer :points
      t.boolean :is_active, :default=>true

      t.timestamps
    end
  end
end
