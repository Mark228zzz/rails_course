# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of :name }
  it { should validate_numericality_of :price }
  it { should have_many :positions }
  it { should have_many :comments }
  it { should have_many :carts }
  it { should have_one :image }


  context 'calculates the price' do
    let!(:item_1) { create :item, price: 10 }
    let!(:item_2) { create :item, price: 20 }
    let!(:order) { create :order }


    it 'calculates the price' do
      order.items << item_1
      order.items << item_2
      p item_1
      p item_2

      expect(order.calculate_total).to be 30.0
    end
  end
end