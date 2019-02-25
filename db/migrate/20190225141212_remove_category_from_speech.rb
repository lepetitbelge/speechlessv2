class RemoveCategoryFromSpeech < ActiveRecord::Migration[5.2]
  def change
    remove_column :speeches, :category
  end
end
