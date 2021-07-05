class CreateCartsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :carts_items, id: false do |t|
      t.integer :carts_id
      t.integer :item_id
    end
  end
end
