class DeviceSchedulesController < ApplicationController
  def create
    @device_schedule = DeviceSchedule.new(params[:device_schedule])
    @device_schedule.garden_device_id = params[:garden_device_id]
    if (@device_schedule.save)
      GardenDeviceServiceController::notify_new_data(@device_schedule.garden_device.id)
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
end
