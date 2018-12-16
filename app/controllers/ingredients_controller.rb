class IngredientsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @ingredient = Ingredient.new(name: params["ingredient"]["name"])
    if @ingredient.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def authenticate_admin!
    super
    raise "Fuck outta here you are not an admin" if (current_admin.email != "bagiotto@brothers.com")
  end
end