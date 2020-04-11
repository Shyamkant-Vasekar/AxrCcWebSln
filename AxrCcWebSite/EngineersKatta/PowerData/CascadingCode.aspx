<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CascadingCode.aspx.vb" Inherits="EngineersKatta_PowerData_CascadingCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
      <h1>Cascading dropdown list with </h1>
      <h1>SqlDataSource conrtrol and </h1>
      <h1>Code Behind with &lt;Select&gt; option</h1>
    
    </div>
      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SsNm" DataValueField="SsId" Height="38px" Width="188px">
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SsId, SsNm FROM MfmDataSs"></asp:SqlDataSource>
      <asp:DropDownList ID="DropDownList2" runat="server" Height="38px" Width="209px">
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BusId, BusNm FROM MfmDataBus WHERE (SsId = @SsId)">
        <SelectParameters>
          <asp:ControlParameter ControlID="DropDownList1" Name="SsId" PropertyName="SelectedValue" />
        </SelectParameters>
      </asp:SqlDataSource>
    </form>
</body>
</html>
