class PagesController < ApplicationController
  def home
    
  end

  def reserve

  end

  def send_reservation
    ApplicationMailer.reservation(params)
    @nominativo = params["user"]
    @telefono = params["phone"]
    @time = params["reservation_time"].values[0]
  end

  def show_location
  end
end
