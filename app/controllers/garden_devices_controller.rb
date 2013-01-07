class GardenDevicesController < ApplicationController

  def index
    @garden_devices = current_user.garden_devices
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @garden_devices }
    end
  end
  
  def show
    if !user_signed_in?
      redirect_to root_path
    else
      @garden_device = GardenDevice.find(params[:id])
      @device_schedule = DeviceSchedule.new
    end
  end
  
  def new
    if !user_signed_in?
      redirect_to root_path
    else
      @garden_device = GardenDevice.new
    end
      
  end
  
  def create
    @garden_device = current_user.garden_devices.build(params[:garden_device])
    if @garden_device.save
      redirect_to garden_devices_path
    else
      render 'new'
    end
  end
end
