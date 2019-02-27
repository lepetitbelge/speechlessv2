class RemoveStartPositionFromContributions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :contributions, :start_position
  end
end
