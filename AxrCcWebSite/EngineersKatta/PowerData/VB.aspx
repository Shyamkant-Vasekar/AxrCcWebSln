<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VB.aspx.vb" Inherits="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
<%--    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>--%>
    <script type="text/javascript">
      //google.charts.load('current', { packages: ['corechart', 'bar'] });
      google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: '220kV Padegaon-I Load',
                width: 1200,
                height: 650,
                bar: { groupWidth: "50%" },
                legend: { position: "none" },
                isStacked: true,
                hAxis: {
                  title: 'Time of Day',
                },
                vAxis: {
                  title: 'Amp'
                }

            };
            $.ajax({
                type: "POST",
                //url: "VB.aspx/GetChartData('A7519B5EDD','2020-02-23','2020-03-01')",
                url: "VB.aspx/GetChartData()",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.ColumnChart($("#chart")[0]);
                    //options.hAxis.format = "dd/mm/yy HH:mm"
                    chart.draw(data, options);
                },
                failure: function (r) {
                  alert(r.d);
                  alert("From Failure");
                },
                error: function (r) {
                    alert(r.d);
                    alert("From Error");
                }
            });
        }
    </script>
    <div id="chart" style="width: 900px; height: 500px;">
    </div>
    </form>
</body>
</html>

