class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :game, null: false
      t.integer :value

      t.timestamps null: false
    end
  end
end
