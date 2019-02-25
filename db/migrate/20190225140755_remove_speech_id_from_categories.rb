class RemoveSpeechIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :speech_id
  end
end
