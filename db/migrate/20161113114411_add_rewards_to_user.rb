class AddRewardsToUser < ActiveRecord::Migration
  def change
    add_column :users, :rewards, :integer, :default=>0
  end
end
