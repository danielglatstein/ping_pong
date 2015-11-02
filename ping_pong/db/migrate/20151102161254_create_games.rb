class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :team_a_id
      t.integer :team_b_id
      t.integer :team_a_points
      t.integer :team_b_points
      t.datetime :match_time
      t.integer :table_id

      t.timestamps null: false
    end
  end
end
