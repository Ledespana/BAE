class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :keyword1, null: false
      t.string :keyword2
      t.string :keyword3
      t.string :response, null: false
      t.string :sentiment
      t.integer :priority
      t.belongs_to :bot, null: false
    end
  end
end
