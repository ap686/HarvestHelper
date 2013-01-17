module ChartHelper
  def google_chart(action, height, params ={})
    params[:format] ||= :json
    path = charts_path(action, params)
    content_tag(:div, :'data-chart' => path, :style => "height: #{height}px;") do
      image_tag('spinner.gif', :size => '24x24')
    end
  end
end
