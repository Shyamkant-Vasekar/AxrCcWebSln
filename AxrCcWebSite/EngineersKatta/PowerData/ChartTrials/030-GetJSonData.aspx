<%@ Page Language="VB" AutoEventWireup="false" CodeFile="030-GetJSonData.aspx.vb" Inherits="EngineersKatta_PowerData_ChartTrials_030_GetJSonData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Get JSON Data</title>



  <style>

    #loadData {
        margin: 10px 0 15px 0;
    }

  </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.css"/>

<script>
  //$(document).ready(function () {

  //  $("#example").DataTable();

  //  // Premade test data, you can also use your own
  //  var testDataUrl = "https://raw.githubusercontent.com/chennighan/RapidlyPrototypeJavaScript/master/lesson4/data.json"



  //  $("#loadData").click(function () {
  //    alert("Clicked");
  //    loadData();
  //  });

  //});

</script>

  <script>



      $(function () {
        $("#example").DataTable();

        // Premade test data, you can also use your own
        var testDataUrl = "https://raw.githubusercontent.com/chennighan/RapidlyPrototypeJavaScript/master/lesson4/data.json"

        alert("Test data url defined");


        $("#loadData").click(function () {
          alert("Button Clicked");
          loadData();
          alert("after loadData");
        });

        function loadData() {
          $.ajax({
            type: 'GET',
            url: testDataUrl,
            contentType: "text/plain",
            dataType: 'json',
            success: function (data) {
              myJsonData = data;
              alert("Clicked from loadData");
              populateDataTable(myJsonData);
            },
            error: function (e) {
              console.log("There was an error with your request...");
              console.log("error: " + JSON.stringify(e));
            }
          });
        }

        // populate the data table with JSON data
        function populateDataTable(data) {
          alert("Start populate data table");
          console.log("populating data table...");
          // clear the table before populating it with more data
          $("#example").DataTable().clear();
          var length = Object.keys(data.customers).length;
          for (var i = 1; i < length + 1; i++) {
            var customer = data.customers['customer' + i];
            alert(customer.first_name);
            // You could also use an ajax property on the data table initialization
            $('#example').dataTable().fnAddData([
              customer.first_name,
              customer.last_name,
              customer.occupation,
              customer.email_address
            ]);
          }
          alert("End populate data table");
        }
        alert("End main function");
      })();
  </script>



</head>
<body>
    <form id="form1" runat="server">
<div class="container">
  <div class="panel">
    <button id="loadData" class="btn btn-default">Load Data</button>


    <table id="example" class="display" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Occupation</th>
          <th>Email Address</th>
        </tr>
      </thead>
    </table>
  </div>
</div>

</form>
</body>
</html>
