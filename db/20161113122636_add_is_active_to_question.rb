class AddIsActiveToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :is_active, :boolean, :default=>true
  end
end
