class UsersInteractions < ActiveRecord::Migration
  def change
    create_table :users_interactions do |t|
      t.belongs_to :user, null: false
      t.belongs_to :interaction, null: false
    end
  end
end
