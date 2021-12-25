class CreateTeamInDivisions < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_in_divisions do |t|
      t.integer :team_id, null: false
      t.integer :division_id, null: false
      t.integer :score, default: 0

      t.timestamps
    end

    add_index :teams_in_divisions, [:division_id, :team_id], unique: true
  end
end
