# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of :name }
  it { should validate_numericality_of :price }
  it { should have_many :position }
  it { should have_many :comments }
  it { should have_many :carts }
  it { should have_one :image }
  
end