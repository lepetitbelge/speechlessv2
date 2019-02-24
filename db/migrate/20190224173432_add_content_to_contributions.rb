class AddContentToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :content, :text
  end
end
