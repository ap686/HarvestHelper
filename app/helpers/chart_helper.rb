module ChartHelper
  def google_chart(action, height, params ={})
    params[:format] ||= :json
    path = charts_path(action, params)
    content_tag(:div, :'data-chart' => path, :style => "height: #{height}px; width:100%;") do
      label_tag('loading')
    end
  end
end
