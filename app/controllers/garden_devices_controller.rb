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
      ScheduleTypeLookup.all.each do |lu|
        schedule = DeviceSchedule.new
        schedule.sensor_flag = lu.flag
        schedule.frequency = 5
        schedule.garden_device = @garden_device
        schedule.is_enabled = (lu.flag == "u")
        schedule.save
      end
      redirect_to garden_devices_path
    else
      render 'new'
    end
  end
end
