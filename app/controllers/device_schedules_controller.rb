class DeviceSchedulesController < ApplicationController
  def create
    @device_schedule = DeviceSchedule.new(params[:device_schedule])
    @device_schedule.garden_device_id = params[:garden_device_id]
    @device_schedule.save
    redirect_to :back
  end
  
  def destroy
    @device_schedule = DeviceSchedule.find(params[:id])
    @device_schedule.destroy
    redirect_to :back
  end
end
