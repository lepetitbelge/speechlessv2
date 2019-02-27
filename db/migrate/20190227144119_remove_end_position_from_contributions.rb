class RemoveEndPositionFromContributions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :contributions, :end_position
  end
end
