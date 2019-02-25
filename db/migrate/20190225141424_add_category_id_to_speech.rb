class AddCategoryIdToSpeech < ActiveRecord::Migration[5.2]
  def change
    add_reference :speeches, :category, foreign_key: true
  end
end
