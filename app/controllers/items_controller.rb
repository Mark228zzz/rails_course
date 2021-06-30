class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all

    render body: @items.map { |i| "#{i.name}:#{i.price}" }.join(', ')
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      render json: item.name, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.permit(:name, :price)
  end
end
