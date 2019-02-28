class AddDefaultPhotoToSpeakers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :speakers, :photo, :string
  	add_column :speakers, :photo, :string, default: 'image/upload/v1551351244/standard_avatar.png'
  end
end
