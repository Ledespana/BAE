class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :category, null: false
      t.string :sentiment
      t.string :keyword1
      t.string :keyword2
      t.string :sentence
      t.string :response, null: false

      t.timestamps null: false
    end
  end
end
