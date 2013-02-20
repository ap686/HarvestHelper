class GardenDevicesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @garden_devices = current_user.garden_devices.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @garden_devices }
    end
  end
  
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
  
  def edit
    @garden_device = GardenDevice.find(params[:id])
  end
  
  def update
    @garden_device = GardenDevice.find(params[:id])
    if @garden_device.update_attributes(params[:garden_device])
      respond_to do |format|
        format.html {redirect_to garden_devices_path, :notice => "Garden Device was successfully updated."}
      end
    else
      respond_to do |format|
        format.html {render action: 'edit'}
      end
    end
  end
  
  def destroy
    @garden_device = current_user.garden_devices.find(params[:id])
    @garden_device.destroy
    respond_to do |format|
      format.html { redirect_to garden_devices_path }
    end    
  end
end
