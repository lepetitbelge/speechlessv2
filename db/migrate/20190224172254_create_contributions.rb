class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.integer :start_position
      t.integer :end_position
      t.references :speech, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
