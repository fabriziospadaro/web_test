class DosesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = item.find(params[:item_id])
    @dose = Dose.new
  end

  def create
    @item = Item.find(params[:item_id])
    @dose = Dose.new(dose_params)
    @dose.item = @item
    if @dose.save
      redirect_to edit_item_path(@item)
    else
      render "items/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to edit_item_path(@dose.item)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  def authenticate_admin!
    super
    raise "Fuck outta here you are not an admin" if (current_admin.email != "bagiotto@brothers.com")
  end
end
