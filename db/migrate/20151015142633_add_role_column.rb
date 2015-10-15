class AddRoleColumn < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: 'Member'
  end
end
