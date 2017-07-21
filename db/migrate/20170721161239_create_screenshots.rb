class CreateScreenshots < ActiveRecord::Migration[5.0]
  def change
    create_table :screenshots do |t|
      t.text :caption
      t.integer :game_id
      t.timestamps
    end
  end
end
