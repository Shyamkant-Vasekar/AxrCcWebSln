Imports System.Data

Partial Class EngineersKatta_PowerData_CascadingCode
    Inherits System.Web.UI.Page



  Protected Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
    Dim Ndx As Integer
    Dim dv As DataView
    Dim dt As DataTable
    If IsPostBack Then
      dv = SqlDataSource2.Select(DataSourceSelectArguments.Empty)
      dt = dv.ToTable
      DropDownList2.Items.Clear()
      DropDownList2.Items.Add(New ListItem("<-- Select -->", "0"))
      For Ndx = 0 To dt.Rows.Count - 1
        DropDownList2.Items.Add(New ListItem(dt.Rows(Ndx).Item(1), dt.Rows(Ndx).Item(0)))
      Next
    End If
  End Sub
End Class
