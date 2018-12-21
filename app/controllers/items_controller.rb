class ItemsController < ApplicationController
  before_action :authenticate_admin!, :except => [:index, :show]

  def index
    tag = params["tags"] || "Tutti"
    @items = Item.by_tag(tag)
    @category = params["category"].to_i
  end

  def show
    @item = Item.find(params[:id])
    @is_admin = admin_signed_in? && current_admin.email == "bagiotto@brothers.com"
  end

  def new
    @item = Item.new
  end

  def destroy
    Item.destroy(params["id"])
    redirect_to item_category_path(0)
  end

  def create
    @item = Item.new(item_params)
    @item.tags = params["item"]["tags"].reject {|c| c.empty?}
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
    @item.tags = params["item"]["tags"].reject {|c| c.empty?}
    @item.save

    redirect_to edit_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :photo, :remote_photo_url,:order_id)
  end

  def authenticate_admin!
    super
    raise "Fuck outta here you are not an admin" if (current_admin.email != "bagiotto@brothers.com")
  end
end
