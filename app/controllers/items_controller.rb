class ItemsController < ApplicationController
  before_action :authenticate_admin!, :except => [:index, :show]

  def index
    @items = Item.all
    @category = params["category"].to_i
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to edit_item_path(@item)
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
    @dose = Dose.new
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.save

    redirect_to edit_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :photo, :remote_photo_url)
  end

  def authenticate_admin!
    super
    raise "Fuck outta here you are not an admin" if (current_admin.email != "bagiotto@brothers.com")
  end
end
