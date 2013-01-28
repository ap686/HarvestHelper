class DeviceSchedulesController < ApplicationController
  def create
    new_schedule = DeviceSchedule.new(params[:device_schedule])
    new_schedule.garden_device_id = params[:garden_device_id]
    
    garden_device = GardenDevice.find(params[:garden_device_id])
    if (garden_device != nil)
      existing_schedule = garden_device.device_schedules.find {|d| d != nil && d.sensor_flag == new_schedule.sensor_flag }
      if (existing_schedule != nil)
        existing_schedule.frequency = new_schedule.frequency
        existing_schedule.is_enabled = new_schedule.is_enabled
        try_save_device_schedule(existing_schedule)
      else
        try_save_device_schedule(new_schedule)
      end
    end
    redirect_to :back
  end
  
  def destroy
    @device_schedule = DeviceSchedule.find(params[:id])
    garden_device_id = @device_schedule.garden_device.id
    if (@device_schedule.destroy)
      GardenDeviceServiceController::notify_new_data(garden_device_id)
    end
    redirect_to :back
  end
  
  private
  
  def try_save_device_schedule(device_schedule)
    if (device_schedule.sensor_flag == "u")
      device_schedule.is_enabled = true
    end
    
    if (device_schedule.save)
      GardenDeviceServiceController::notify_new_data(device_schedule.garden_device.id)      
    end
  end
end
