class CreateCommonConfigs < ActiveRecord::Migration
  def change
    create_table :common_configs do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
