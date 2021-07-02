class AddVotesCountToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :votes_count, :integer, default: 0
  end
end
