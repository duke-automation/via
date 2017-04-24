//= require jsapi
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require chart.min
//= require chartkick.min
//= require moment
//= require bootstrap-datetimepicker
// require_tree .

$(document).ready(function() {
    $('.has-tooltip').tooltip();
});

// defaults for chart.js
Chart.defaults.global = {
    pointLabelFontFamily : "'sans-serif'"
}

$(function () {
    var options = {};
    options['timeZone'] = 'America/New_York';
     $('#datetimepicker6').datetimepicker();
    $('#datetimepicker7').datetimepicker({
        useCurrent: false //Important! See issue #1075
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});
