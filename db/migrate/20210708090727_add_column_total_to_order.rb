class AddColumnTotalToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total, :float
  end
end
