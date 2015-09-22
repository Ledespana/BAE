class ChangeUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :username, null: false
      t.string :gender, null: false
      t.string :profile_picture
      t.string :phone_number
      t.string :description
    end
  end
end
