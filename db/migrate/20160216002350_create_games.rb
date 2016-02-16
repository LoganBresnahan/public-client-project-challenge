class CreateGames < ActiveRecord::Migration
  def change

    # Note, did not add categories in this migration, as it does not exist yet
    create_table :games do |t|
      t.string :name, null: false
      t.integer :min_players
      t.integer :max_players
      t.string :thumbnail_url
      t.text :description, null: false
      t.integer :year_published
      t.integer :playing_time
      t.integer :min_age

      t.timestamps null: false
    end

    add_index :games, :name
  end
end
