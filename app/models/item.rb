class Item < ApplicationRecord

  validates :price, numericality: { greater_than: 0, allow_nil: nil }
  validates :name, presence: true

  after_initialize{ p 'initialize' } # Item.new Item.first
  after_save      { p 'save' }       # Item.create Item.save
  after_create    { p 'create' }     # Item.create
  after_update    { p 'update' }     # Item.update
  after_destroy   { p 'destroy' }    # Item.last.destroy
end
