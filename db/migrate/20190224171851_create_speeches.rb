class CreateSpeeches < ActiveRecord::Migration[5.2]
  def change
    create_table :speeches do |t|
      t.string :title
      t.date :date
      t.string :country
      t.string :city
      t.string :category
      t.string :content
      t.time :duration
      t.references :speaker, foreign_key: true

      t.timestamps
    end
  end
end
