class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :competitor_id
      t.string :status
      t.string :result

      t.timestamps
    end
  end
end
