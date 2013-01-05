class GardenDevicesController < ApplicationController
  def show
    if !signed_in?
      redirect_to root_path
    else
      @garden_device = GardenDevice.find(params[:id])
      @device_schedule = DeviceSchedule.new
    end
  end
  
  def new
    if !signed_in?
      redirect_to root_path
    else
      @garden_device = GardenDevice.new
    end
      
  end
  
  def create
    @garden_device = current_user.garden_devices.build(params[:garden_device])
    if @garden_device.save
      redirect_to current_user
    else
      render 'new'
    end
  end
end
