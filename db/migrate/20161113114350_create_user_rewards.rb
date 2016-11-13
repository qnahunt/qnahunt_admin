class CreateUserRewards < ActiveRecord::Migration
  def change
    create_table :user_rewards do |t|
      t.references :user, index: true
      t.references :rewards, index: true

      t.timestamps
    end
  end
end
