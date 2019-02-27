class ChangeDurationToBeIntegerInSpeeches < ActiveRecord::Migration[5.2]
  def change
  	change_column :speeches, :duration, :integer
  end
end
