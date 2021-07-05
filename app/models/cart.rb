class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many   :positions
  has_many   :items, through: :positions


  # TODO: for carts_items
  # has_and_belongs_to_many :items
end