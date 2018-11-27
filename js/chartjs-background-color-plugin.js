/**
*  This is a global Chart.js plugin that allows defining chart's background color in chart
*  Based on https://stackoverflow.com/a/37160090/7480906
*  Colors entire canvas, not just chart area - useful when exporting chart to picture.
*/

Chart.pluginService.register({
  beforeDraw: function (chart, easing) {
    if (chart.config.options.chartArea && chart.config.options.chartArea.backgroundColor) {
        const ctx = chart.ctx;
        ctx.save();
        ctx.fillStyle = chart.config.options.chartArea.backgroundColor;
        ctx.fillRect(0, 0, chart.width, chart.height);
        ctx.restore();
    }
  }
});
