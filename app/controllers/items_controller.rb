class ItemsController < ApplicationController
  layout false 
  skip_before_action :verify_authenticity_token
  before_action :find_item, only: %i[show edit destroy update upvote]
  before_action :admin?,    only: %i[edit]
  after_action  :show_info, only: %i[index]
  def index
    @items = Item.all
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      redirect_to item_path(item)
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  # def new

  #end

  #def show
  #   render body: 'Page not found', status: 404 unless @item
  # end

  #def edit
  #   render body: 'Page not found', status: 404 unless @item
  # end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to '/items'
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def upvote
    @item.increment! :votes_count
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 50')
    render :index
  end

  private

  def items_params
    params.permit(:name, :price, :description)
  end
  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def admin?
    render_404 unless params[:admin]
  end

  def show_info
    puts 'Index endpoint'
  end
end