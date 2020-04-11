<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DisplayData.aspx.vb" Inherits="EngineersKatta_PowerData_Trial" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PowerLinkV2</title>
    <style type="text/css">
        input[type=text]
        {
            margin-right:5px;
            position:relative;
            top:-1px;
        left: 1px;
        width: 100px;
        height: 19px;
      }
      #form1 {
        background-color: #DDFFEC;
      }
    </style>

    <script type = "text/javascript">
      function SetSource(SourceID) {
        var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
          hidSourceID.value = SourceID;
        }
    </script> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />

    <script type="text/javascript">
      $(function () {
        $("[id*=txtDate1]").datepicker({
          showOn: 'button',
          buttonImageOnly: true,
          buttonImage: '../img/calendar.png'
        });
      });
      $(function () {
        $("[id*=txtDate2]").datepicker({
          showOn: 'button',
          buttonImageOnly: true,
          buttonImage: '../img/calendar.png'
        });
      });
    </script>
</head>
<body style="width: 960px; margin: auto">
    <form id="form1" runat="server">
    <div style="width: 960px; margin-left: 70px; font-size: x-large;">
      PowerLinkV2 Data
    </div>

<div style="width: 960px; margin-left: 70px">

<%--      <asp:Label ID="Label3" runat="server" Font-Names="Arial" Text="Start Date for Recording"></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Font-Names="Arial" Text="22/02/20 15:00 Hrs"></asp:Label>
      <br />--%>
      <br />
      <asp:Label ID="Label10" runat="server" Text="Data Status" Font-Names="Arial" Font-Size="Large"></asp:Label>
      <br />
      <asp:Table ID="Table1" runat="server" Width="226px" BackColor="#FFFFCC" Font-Names="Arial" ForeColor="#0000CC" GridLines="Both" Height="110px">
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            <asp:Label ID="Label1" runat="server" Text="Last Week"></asp:Label></asp:TableCell>
          <asp:TableCell runat="server">
            <asp:Label ID="LblLstWkAvbl" runat="server" Text="##.##%"></asp:Label></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            <asp:Label ID="Label8" runat="server" Text="This Week"></asp:Label></asp:TableCell>
          <asp:TableCell runat="server">
            <asp:Label ID="LblThisWkAvbl" runat="server" Text="##.##%"></asp:Label></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            <asp:Label ID="Label12" runat="server" Text="Yesterday"></asp:Label></asp:TableCell>
          <asp:TableCell runat="server">
            <asp:Label ID="LblYstAvbl" runat="server" Text="##.##%"></asp:Label></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            <asp:Label ID="Label14" runat="server" Text="Today"></asp:Label></asp:TableCell>
          <asp:TableCell runat="server">
            <asp:Label ID="LblTodayAvbl" runat="server" Text="##.##%"></asp:Label></asp:TableCell>
        </asp:TableRow>
      </asp:Table>
      <br />
      <br />
      <asp:Label ID="Label2" runat="server" Font-Size="Large" ForeColor="#0000A0" Text="Select Parameters for displaying data"></asp:Label>
      <br />
      <asp:Table ID="Table2" runat="server" BackColor="#CCCCFF">
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            Substation:
          </asp:TableCell>
          <asp:TableCell runat="server">
            <asp:DropDownList ID="DropDownList1" runat="server" Height="35px" Width="180px" AutoPostBack="True" AppendDataBoundItems="True" >
              <asp:ListItem Text="< -- Select -- >" Value="0000"></asp:ListItem>
            
</asp:DropDownList>
          
</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            Bus:
          </asp:TableCell>
          <asp:TableCell runat="server">
            <asp:DropDownList ID="DropDownList2" runat="server" Height="35px" Width="180px" AutoPostBack="True" AppendDataBoundItems="True">
              <asp:ListItem Text="< -- Select -- >" Value="0000"></asp:ListItem>
            
</asp:DropDownList>
          
</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            Bay:
          </asp:TableCell>
          <asp:TableCell runat="server">
            <asp:DropDownList ID="DropDownList3" runat="server" Height="35px" Width="180px" AutoPostBack="True" AppendDataBoundItems="True">
              <asp:ListItem Text="< -- Select -- >" Value="0000000000"></asp:ListItem>
            
</asp:DropDownList>
<br />
          </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            Start Date:
          </asp:TableCell>
          <asp:TableCell runat="server">
            <asp:TextBox ID="txtDate1" runat="server" ReadOnly="true" AutoPostBack="True"></asp:TextBox>          
          </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
          <asp:TableCell runat="server">
            End Date:
          </asp:TableCell>
          <asp:TableCell runat="server">
            <asp:TextBox ID="txtDate2" runat="server" ReadOnly="true" AutoPostBack="True"></asp:TextBox>          
          </asp:TableCell>
        </asp:TableRow>
      </asp:Table>

</div>

      <br />
      <hr />

    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      //google.charts.load('current', { packages: ['corechart', 'bar'] });

      google.load("visualization", "1", { packages: ["corechart"] });
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var options = {
          title: 'Amp. Load Chart New',
          bar: { groupWidth: '50%' },
          legend: { position: "none" },
          isStacked: true,
          seriesType: 'bars',
          series: { 1: { type: 'line' } },
          hAxis: {
            Type: 'datetime',
            format: "dd/MM HH:mm",
          }

        };
        $.ajax({
          type: "POST",
          url: 'DisplayData.aspx/GetChartData',
          data: "{bid:'<% =DropDownList3.SelectedValue%>',start1:'<% =hdnStart.Value%>',end1:'<% =hdnEnd.Value%>'}",
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (r) {

            var data1 = new google.visualization.DataTable();
 
            data1.addColumn('datetime', 'DtTm');
            data1.addColumn('number', 'Amp');
            //data1.addColumn('datetime', 'DtTm');
            data1.addColumn('number', 'Amp');

            // instead of this we will add row one by one after accessing data because we have set column data type programatically
            //var data1 = google.visualization.arrayToDataTable(r.d);

            for (var i = 1; i < r.d.length; i++) {
              data1.addRows([
                  [new Date(r.d[i][0]), r.d[i][1], r.d[i][1]]
              ]);
            }
            var chart = new google.visualization.ComboChart($("#chart")[0]);
            chart.draw(data1, options);
          },
          failure: function (r) {
            //alert(r.d);
            //alert("From Failure");
          },
          error: function (r) {
            //alert(r.d);
            //alert("From Error");
          }
        });
      }
    </script> 
    <div id="chart" style="width: 960px; height: 400px;">
    </div>
      <hr />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="24" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <asp:BoundField DataField="DtTm" DataFormatString="{0:dd/MM HH:mm}" HeaderText="DtTm" SortExpression="DtTm">
          <ItemStyle HorizontalAlign="Left" Width="100px" />
          </asp:BoundField>
          <asp:BoundField DataField="Amp" DataFormatString="{0:f1}" HeaderText="Amp" SortExpression="Amp">
          <ItemStyle HorizontalAlign="Right" Width="50px" />
          </asp:BoundField>
          <asp:BoundField DataField="Mw" DataFormatString="{0:f2}" HeaderText="Mw" SortExpression="Mw">
          <ItemStyle HorizontalAlign="Right" Width="70px" />
          </asp:BoundField>
          <asp:BoundField DataField="Mvar" DataFormatString="{0:f2}" HeaderText="Mvar" SortExpression="Mvar">
          <ItemStyle HorizontalAlign="Right" Width="70px" />
          </asp:BoundField>
          <asp:BoundField DataField="MwhI" DataFormatString="{0:f2}" HeaderText="MwhI" SortExpression="MwhI">
          <ItemStyle HorizontalAlign="Right" Width="90px" />
          </asp:BoundField>
          <asp:BoundField DataField="MwhE" DataFormatString="{0:f2}" HeaderText="MwhE" SortExpression="MwhE">
          <ItemStyle HorizontalAlign="Right" Width="90px" />
          </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetRecordsBetweenDates" SelectCommandType="StoredProcedure">
        <SelectParameters>
          <asp:ControlParameter ControlID="txtDate1" Name="Start" PropertyName="Text" DbType="Date" />
          <asp:ControlParameter ControlID="txtDate2" DbType="Date" Name="End" PropertyName="Text" />
          <asp:ControlParameter ControlID="DropDownList3" Name="BayId" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
      </asp:SqlDataSource>
      <br />
      <br />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MfmDataSs]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BusId, BusNm FROM MfmDataBus WHERE (SsId = @SsId)">
        <SelectParameters>
          <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="SsId" PropertyName="SelectedValue" />
        </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BayId, BayNm FROM MfmDataBay WHERE (BusId = @BusId) AND Len(BayId)=10">
        <SelectParameters>
          <asp:ControlParameter ControlID="DropDownList2" Name="BusId" PropertyName="SelectedValue" />
        </SelectParameters>
      </asp:SqlDataSource>
      <br />

<%--      <asp:Button ID="Submit" runat="server" Text="Button"  OnClientClick = "SetSource(this.id)" />
      <asp:Button ID="Button1" runat="server" Text="Submit"  OnClientClick = "SetSource(this.id)" />--%>
      <asp:HiddenField ID="hidSourceId" Value="" runat="server" />
<%--      <asp:HiddenField ID="hdnStart" Value="2020-02-23" runat="server" />
      <asp:HiddenField ID="hdnEnd" Value="2020-03-10" runat="server" />--%>
      <asp:HiddenField ID="hdnStart" runat="server" />
      <asp:HiddenField ID="hdnEnd" runat="server" />
      <div>
        <asp:SqlDataSource ID="SDSTotalRec" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select Count(*) From MfmData020 Where DtTm &gt; '2020-03-01 23:00:00.000'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSBayCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetNumberOfBays" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSTodaysRec" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetTodaysRecords" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSYesterdaysRec" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetYesterdaysRecords" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSThisWeekRec" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetThisWeekRecords" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSPreviousWeekRec" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetPreviousWeekRecords" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
      </div>

    </form>
</body>
</html>



