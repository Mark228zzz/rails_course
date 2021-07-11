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

    it 'redirect to index' do
      expect(subject).to redirect_to action: :index
    end

    context 'with invalid param' do
      let (:items_param) do
        { item: { price: -20 } }
      end

      it 'dos`t save' do
        expect { subject }.to_not change(Item, :count)
        is_expected.to render_template :new
      end

      it 'render new template' do
        is_expected.to render_template :new
      end
    end
  end
  context 'DELETE #destroy' do
    subject { delete :destroy, params: params }
    let(:params) { { id: item.id } }

    it 'deletes from Item' do
      item.reload
      expect { subject }.to change(Item, :count).by (-1)
    end
    it 'render index template' do
      is_expected.to render_template :index
    end
  end
end