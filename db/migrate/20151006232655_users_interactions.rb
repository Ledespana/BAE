class UsersInteractions < ActiveRecord::Migration
  def up
    add_column :interactions, :user_id, :integer, null: false
  end

  def down
    remove_column :interactions, :user_id, :integer, null: false
  end
end
