class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_one :image, as: :imageable

  after_initialize{ p 'initialize' } # Item.new Item.first
  after_save      { p 'save' }       # Item.create Item.save
  after_create    { p 'create' }     # Item.create
  after_update    { p 'update' }     # Item.update
  after_destroy   { p 'destroy' }    # Item.last.destroy end

# TODO: for carts_items
# has_and_belongs_to_many :carts
 end