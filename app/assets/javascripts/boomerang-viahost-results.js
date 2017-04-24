VIAHOST.subscribe('before_beacon', function (via) {
    var htmlviahost = "", t_name, t_other, viahostother = [];

    if (!via.t_other) via.t_other = "";

    for (var viaitem in via) {
        if (!viaitem.match(/^(t_done|t_other|bw|lat|bw_err|lat_err|u|r2?)$/)) {
            if (viaitem.match(/^t_/)) {
                via.t_other += "," + viaitem + "|" + via[viaitem];
            }
            else {
                viahostother.push(viaitem + " = " + via[viaitem]);
            }
        }
    }
    htmlviahost += "<div><b>your connection: ";
    if (via.bw) {
        htmlviahost += "bandwidth " + parseFloat(via.bw * 8 / 1024 / 1024).toFixed(2) + " mbps";
    }
    htmlviahost += ", ";
    if (via.lat) {
        //htmlviahost += "latency " + parseFloat(via.lat).toFixed(2) + " ms (&#x00b1;" + via.lat_err + ")<br>";
        htmlviahost += "latency " + parseFloat(via.lat).toFixed(2) + " ms";
    }
    htmlviahost +="</b></div>";

    var r = document.getElementById('viahost_results');
    r.innerHTML = htmlviahost;

    var bwgraph = parseFloat(via.bw * 8 / 1024 / 1024).toFixed(2);
    var latgraph = parseFloat(via.lat).toFixed(2);
    //chart.js
    $.getScript('/assets/chart.min.js', function() {
        var bwdata = {
            labels: ["Bandwidth (mbps)"],
            datasets: [
                {
                    label: "You",
                    scaleGridLineWidth: 1,
                    fillColor: "rgba(255,175,0,0.5)",
                    strokeColor: "rgba(255,175,0,0.8)",
                    highlightFill: "rgba(255,175,0,0.75)",
                    highlightStroke: "rgba(255,175,0,1)",
                    data: [bwgraph]
                },
                {
                    label: "Average",
                    scaleGridLineWidth: 1,
                    fillColor: "rgba(151,187,205,0.5)",
                    strokeColor: "rgba(151,187,205,0.8)",
                    highlightFill: "rgba(151,187,205,0.75)",
                    highlightStroke: "rgba(151,187,205,1)",
                    data: [gon.viahostbw]
                }
            ]
        };
        var bwctx = document.getElementById("bwbarchart").getContext("2d");
        var bwBarChart = new Chart(bwctx).Bar(bwdata, {scaleIntegersOnly: true});
    });

    $.getScript('/assets/chart.min.js', function()
    {
        var data = {
            labels: ["Latency (ms)"],
            datasets: [
                {
                    label: "You",
                    scaleGridLineWidth : 1,
                    fillColor: "rgba(255,175,0,0.5)",
                    strokeColor: "rgba(255,175,0,0.8)",
                    highlightFill: "rgba(255,175,0,0.75)",
                    highlightStroke: "rgba(255,175,0,1)",
                    data: [latgraph]
                },
                {
                    label: "Average",
                    scaleGridLineWidth : 1,
                    fillColor: "rgba(151,187,205,0.5)",
                    strokeColor: "rgba(151,187,205,0.8)",
                    highlightFill: "rgba(151,187,205,0.75)",
                    highlightStroke: "rgba(151,187,205,1)",
                    data: [gon.viahostlat]
                }
            ]
        };
        var legend = '';
        for(var i = 0; i < data["datasets"].length; i++) {
            legend += "<div style=\"font-family: sans-serif; font-size:11px; text-align: center; margin-top: 0px; background-color:" + data["datasets"][i]["fillColor"] + ";border:2px solid " + data["datasets"][i]["strokeColor"] + ";height: 20px; width: 150px; float: left; margin: 5px;\">" + data["datasets"][i]["label"] + "</div>";
        }
        var ctx = document.getElementById("barchart").getContext("2d");
        var myBarChart = new Chart(ctx).Bar(data, {scaleIntegersOnly: true});
        document.getElementById("barlegend").innerHTML = legend;
    });
    r.innerHTML += "<br>";

});
