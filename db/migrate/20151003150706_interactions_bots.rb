class InteractionsBots < ActiveRecord::Migration
  def change
    create_table :bots_interactions do |t|
      t.belongs_to :bot, null: false
      t.belongs_to :interaction, null: false
    end
  end
end
