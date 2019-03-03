class AddVoteSumToSpeeches < ActiveRecord::Migration[5.2]
  def change
    add_column :speeches, :vote_sum, :integer, default: 0
  end
end
