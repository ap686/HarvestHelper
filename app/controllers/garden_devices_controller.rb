class GardenDevicesController < ApplicationController
  def show
    @garden_device = GardenDevice.find(params[:id])
    @device_schedule = DeviceSchedule.new
  end
  
  def new
    @garden_device = GardenDevice.new
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
