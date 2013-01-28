class GardenDeviceServiceController < ApplicationController
  @@devices_updated = {}
  @@mutex = Mutex.new

  def self.notify_new_data(device_id)
    @@mutex.synchronize {
      @@devices_updated[device_id] = true
    }
  end
  
  def poll_for_updates
    begin
      garden_device = GardenDevice.find_by_serial_number(params[:sn])
      if (garden_device)
        new_data = false
        @@mutex.synchronize {
          if (@@devices_updated.has_key?(garden_device.id))
            new_data = @@devices_updated[garden_device.id]
          else
            new_data = true
          end
          @@devices_updated[garden_device.id] = false          
        }
        if (new_data)
          schedules = garden_device.device_schedules
          output = schedules.map{|s| s.is_enabled ? "*/#{s.frequency} * * * * /usr/sbin/client -#{s.sensor_flag}\n" : ""}.join("")
          render :text => output
        else
          render :nothing => true, :status => :ok
        end
      else
        render :nothing => true, :status => 500
      end
    rescue
      render :nothing => true, :status => 500
    end
  end
  
  def receive_data
    begin
      garden_device = GardenDevice.find_by_serial_number(params[:sn])
      if (garden_device)
        garden_data = garden_device.garden_datas.new
        garden_data.temperature = params[:Temperature]
        garden_data.humidity = params[:Humidity]
        garden_data.lux = params[:Lux]
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