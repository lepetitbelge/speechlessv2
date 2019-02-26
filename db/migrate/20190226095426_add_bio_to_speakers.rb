class AddBioToSpeakers < ActiveRecord::Migration[5.2]
  def change
    add_column :speakers, :bio, :string
  end
end
