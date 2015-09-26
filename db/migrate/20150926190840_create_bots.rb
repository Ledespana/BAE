class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.string :name, null: false
      t.string :eye_color, null: false
      t.string :hair_color, null: false
      t.integer :age, null: false
      t.string :description
      t.belongs_to :user, null: false
    end
  end
end
