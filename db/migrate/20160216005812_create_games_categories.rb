class CreateGamesCategories < ActiveRecord::Migration
  def change
    create_table :games_categories do |t|
      t.integer :game_id
      t.integer :category_id
    end
  end
end
