class AddPhotoToSpeakers < ActiveRecord::Migration[5.2]
  def change
    add_column :speakers, :photo, :string
  end
end
