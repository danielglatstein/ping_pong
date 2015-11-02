class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.timestamps null: false
    end
  end
end
