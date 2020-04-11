<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DisplayDataX.aspx.vb" Inherits="EngineersKatta_PowerData_DisplayData" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PowerLinkV2</title>
</head>
<body style="width: 900px; margin: auto; background-color: #FFFFCC;">
    <form id="form1" runat="server">
      <h1  style="width: 280px; color: #000080;">400kV Waluj S/S Power and Enrgy Data</h1>
      <asp:Label ID="Label3" runat="server" Text="Start Date for Recording" Font-Names="Arial" Font-Size="Larger"></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="01/03/20 23:00 Hrs" Font-Names="Arial" Font-Size="Larger"></asp:Label>
      <br />
      <br />
      <asp:Label ID="Label5" runat="server" Text="Number of Records Expected Uptill Now" Font-Names="Arial" Font-Size="Larger"></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblExpRec" runat="server" Text="NNN" Font-Names="Arial" Font-Size="Larger"></asp:Label>
      <br />
      <br />
      <asp:Label ID="Label7" runat="server" Text="Number of Records Available" Font-Names="Arial" Font-Size="Larger"></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblAvblRec" runat="server" Text="NNN" Font-Names="Arial" Font-Size="Larger" DataSourceID = "SqlDataSource4" AutoGenerateColumns = "false"></asp:Label>
      <br />
      <br />
      <asp:Label ID="Label9" runat="server" Text="Percentage of Record Availability" Font-Names="Arial" Font-Size="Larger"></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LblPrcntAvbl" runat="server" Text="NNN" Font-Names="Arial" Font-Size="Larger"></asp:Label>
      <br />
      <br />
      <asp:Label ID="Label2" runat="server" Text="Select Date" Font-Size="Large" ForeColor="#0000A0"></asp:Label>
      <br />
      <br />
      <asp:Calendar ID="Calendar1" runat="server" AutoPostBack="True" BackColor="#CCFFFF">
        <TitleStyle BackColor="#66CCFF" />
      </asp:Calendar>
      <br />
      <asp:Label ID="Label1" runat="server" Text="Select Bay ID" Font-Size="Large" ForeColor="#003366"></asp:Label>
      <br />
      <br />
      <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" Width="270px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BayNm" DataValueField="BayId" Font-Size="Large" BackColor="#CCFFFF">
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT BayId, BayNm FROM MfmDataBay"></asp:SqlDataSource>
      <br />
      <br />
      <br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="675px" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
          <asp:BoundField DataField="DtTm" HeaderText="DtTm" SortExpression="DtTm" DataFormatString="{0:dd/MM/yy HH:mm}" />
          <asp:BoundField DataField="Amp" HeaderText="Amp" SortExpression="Amp" DataFormatString="{0:f1}" />
          <asp:BoundField DataField="Mw" HeaderText="Mw" SortExpression="Mw" DataFormatString="{0:f2}" />
          <asp:BoundField DataField="Mvar" HeaderText="Mvar" SortExpression="Mvar" DataFormatString="{0:f2}" />
          <asp:BoundField DataField="MwhI" HeaderText="MwhI" SortExpression="MwhI" DataFormatString="{0:f0}" />
          <asp:BoundField DataField="MwhE" HeaderText="MwhE" SortExpression="MwhE" DataFormatString="{0:f0}" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM MfmData020 WHERE (DtTm &gt; @DtTm) AND (BayID = @BayID) ORDER BY DtTm">
        <SelectParameters>
          <asp:ControlParameter ControlID="Calendar1" Name="DtTm" PropertyName="SelectedDate" />
          <asp:ControlParameter ControlID="DropDownList1" Name="BayID" PropertyName="SelectedValue" />
        </SelectParameters>
      </asp:SqlDataSource>
      <br />
      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select Count(*) From MfmData020 Where DtTm &gt; '2020-02-22 15:00:00.000'"></asp:SqlDataSource>
      <br />
      


    </form>
</body>
</html>
