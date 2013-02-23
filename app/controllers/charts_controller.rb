class ChartsController < ApplicationController
  def temperature_graph
    if (!user_signed_in?)
      render :json => {}
    else
      device = GardenDevice.find(params[:device_id])
      rows = []
      columns = [['datetime', 'Time'], ['number', 'Temperature']]
      device.garden_datas.each do |data|
        if data.temperature != nil
          rows << [ActiveSupport::TimeZone[device.timezone].utc_to_local(data.sensor_time).to_i, data.temperature.to_f]
        end
      end
      render_graph('LineChart', 'Temperature Data', rows, columns)
    end
  end
  
  def humidity_graph
    if (!user_signed_in?)
      render :json => {}
    else
      device = GardenDevice.find(params[:device_id])
      rows = []
      columns = [['datetime', 'Time'], ['number', 'Humidity']]
      device.garden_datas.each do |data|
        if data.humidity != nil
          rows << [ActiveSupport::TimeZone[device.timezone].utc_to_local(data.sensor_time).to_i, data.humidity.to_f]
        end
      end
      render_graph('LineChart', 'Humidity Data', rows, columns)
    end
  end
  
  def light_graph
    if (!user_signed_in?)
      render :json => {}
    else
      device = GardenDevice.find(params[:device_id])
      rows = []
      columns = [['datetime', 'Time'], ['number', 'Lux']]
      device.garden_datas.each do |data|
        if data.lux != nil
          rows << [ActiveSupport::TimeZone[device.timezone].utc_to_local(data.sensor_time).to_i, data.lux.to_f]
        end
      end
      render_graph('LineChart', 'Light Data', rows, columns)
    end
  end
  
  private
  
  def render_graph(chart_type, title, rows, columns)
      render :json => {
        :type => chart_type,
        :cols => columns,
        :rows => rows,
        :options => { 
          :allowRedraw => true,
          :scaleType => "maximized"
        }
      }
  end
end
