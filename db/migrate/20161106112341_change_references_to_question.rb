class ChangeReferencesToQuestion < ActiveRecord::Migration
  def change
    remove_reference :questions, :category
    add_reference :questions, :sub_category
  end
end
