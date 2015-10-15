class CreateIndex < ActiveRecord::Migration
  def change
    add_index :interactions, [:sentence, :keyword1, :keyword2], name: 'index_interactions'
  end
end
