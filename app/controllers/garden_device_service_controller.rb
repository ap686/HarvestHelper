class GardenDeviceServiceController < ApplicationController
  def receive_data
    begin
      puts params
      garden_device = GardenDevice.find_by_serial_number(params[:sn])
      if (garden_device)
        garden_data = garden_device.garden_datas.new
        garden_data.temperature = params[:Degrees]
        garden_data.humidity = params[:Humidity]
        garden_data.save
        render :nothing => true, :status => :ok
      else
        render :nothing => true, :status => 500
      end
    rescue
      render :nothing => true, :status => 500
    end
  end
end
