# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  render_views

  let(:items) { create_list :item, 5 }
  let(:item) { create :item }

  let(:items_param) do
    {
    item: {
      name: 'car',
      price: 50,
      description: 'black'
      }
    }
  end


  context 'GET #show' do
    before { get :index }

    it 'returns items' do
      is_expected.to render_template :index
      expect(assigns(:items)).to match_array(items)
    end
  end

  context 'POST #create' do
    subject { post :create, params: items_param }

    it 'saves the item' do
      expect { subject }.to change(Item, :count).by 1
    end
  end
end