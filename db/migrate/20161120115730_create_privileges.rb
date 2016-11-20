class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :name
      t.string :description
      t.integer :points
      t.boolean :is_active

      t.timestamps
    end
  end
end
