jQuery(function ($) {
  // Load Google visualization library if a chart element exists
  if ($('[data-chart]').length > 0) {
    $.getScript('https://www.google.com/jsapi', function (data, textStatus) {
      google.load('visualization', '1', { 'packages': ['annotatedtimeline'], 'callback': function () {
        // Google visualization library loaded
        $('[data-chart]').each(function () {
          var div = $(this)
          // Fetch chart data
          $.getJSON(div.data('chart'), function (data) {
            // Create DataTable from received chart data
            var table = new google.visualization.DataTable();
            $.each(data.cols, function () { table.addColumn.apply(table, this); });
            $.each(data.rows, function () {
              var d = new Date();
              d.setTime(this[0] * 1000);
              this[0] = convertDateToUTC(d);
              table.addRow(this);
            });
            var chart = new google.visualization.AnnotatedTimeLine(div.get(0));
            chart.draw(table, data.options);
          });
        });
      }});
    });
  }
});

function convertDateToUTC(date) 
{ 
  return new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds()); 
}