Imports System.Data

Partial Class EngineersKatta_PowerData_DisplayData
  Inherits System.Web.UI.Page

  Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    Dim DtStart As Date = New Date(2020, 2, 22, 15, 0, 0)  '"22/02/20 15:00"
    Dim DtNow As Date = Date.UtcNow()
    Dim HoursLapsed As Integer
    Dim ExpectedRec As Integer
    Dim dv As DataView = SqlDataSource4.Select(DataSourceSelectArguments.Empty)
    Dim dt As DataTable = dv.ToTable
    Dim dr As DataRow = dt.Rows.Item(0)
    Dim AvailableRec As Integer = dr.Item(0)
    Dim PrcntAvblRec As Double
    DtNow = DtNow.AddHours(5)
    DtNow = DtNow.AddMinutes(30)

    HoursLapsed = DateDiff(DateInterval.Hour, DtStart, DtNow) + 1
    ExpectedRec = 12 * HoursLapsed
    PrcntAvblRec = 100.0 * AvailableRec / ExpectedRec
    LblExpRec.Text = Format(ExpectedRec, "000")
    LblAvblRec.Text = Format(AvailableRec, "000")
    LblPrcntAvbl.Text = Format(PrcntAvblRec, "00.0") & "%"

  End Sub


End Class
