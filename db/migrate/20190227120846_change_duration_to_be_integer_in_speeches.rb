class ChangeDurationToBeIntegerInSpeeches < ActiveRecord::Migration[5.2]
  def change
  	remove_column :speeches, :duration
  	add_column :speeches, :duration, :integer
  end
end
