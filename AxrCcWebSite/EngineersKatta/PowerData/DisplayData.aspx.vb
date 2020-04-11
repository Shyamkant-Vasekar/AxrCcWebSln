Imports System.Data
Imports System.Globalization
Imports System.Web.Services
Imports System.Configuration
Imports System.Data.SqlClient

Partial Class EngineersKatta_PowerData_Trial
    Inherits System.Web.UI.Page

  Public MyDx(10) As Integer

  Protected Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
    Dim DtStart As Date = New Date(2020, 3, 1, 23, 0, 0)  '"01/03/20 23:00"
    Dim DtNow As Date = Date.UtcNow()
    Dim HoursLapsed As Integer
    Dim DataAvbl As Double
    Dim dv As DataView = SDSTotalRec.Select(DataSourceSelectArguments.Empty)
    Dim dt As DataTable = dv.ToTable
    Dim dr As DataRow = dt.Rows.Item(0)
    Dim AvailableRec As Integer = dr.Item(0)
    DtNow = DtNow.AddHours(5)
    DtNow = DtNow.AddMinutes(30)
    If hdnStart.Value = Nothing Then
      hdnStart.Value = Format(DateAdd(DateInterval.Day, -10, DtNow), "yyyy-MM-dd")
    End If
    If hdnEnd.Value = Nothing Then
      hdnEnd.Value = Format(DtNow, "yyyy-MM-dd")
    End If
    'Last week data status
    Dim NumberOfBays As Integer
    Dim LastWeekExpectedData As Integer
    Dim LastWeekAvailableData As Integer = GetNumberOfRecords(SDSPreviousWeekRec)
    NumberOfBays = GetNumberOfRecords(SDSBayCount)
    LastWeekExpectedData = 24 * 7 * NumberOfBays
    LblLstWkAvbl.Text = Format(LastWeekAvailableData / LastWeekExpectedData * 100.0, "0.00") & "%"

    'This week data status
    Dim ThisWeekAvblData As Integer = GetNumberOfRecords(SDSThisWeekRec)
    Dim ThisWeekExpectedData As Integer

    Dim DtStartOfWeek As Date
    If DtNow.DayOfWeek > 0 Then
      DtStartOfWeek = (DateAdd(DateInterval.Day, 1 - DtNow.DayOfWeek, DtNow)).Date
    Else
      DtStartOfWeek = (DateAdd(DateInterval.Day, -6, DtNow)).Date
    End If
    HoursLapsed = DateDiff(DateInterval.Hour, DtStartOfWeek, DtNow) + 1
    ThisWeekExpectedData = HoursLapsed * NumberOfBays
    LblThisWkAvbl.Text = Format(ThisWeekAvblData / ThisWeekExpectedData * 100.0, "0.00") & "%"

    'Yesterdays data status
    Dim YesterdaysAvblData As Integer = GetNumberOfRecords(SDSYesterdaysRec)
    Dim YesterdaysExptdData As Integer = 24 * NumberOfBays
    LblYstAvbl.Text = Format(YesterdaysAvblData / YesterdaysExptdData * 100.0, "0.00") & "%"

    'Todays data status
    Dim TodaysAvbData As Integer = GetNumberOfRecords(SDSTodaysRec)
    Dim ExpectedRec As Integer
    HoursLapsed = DateDiff(DateInterval.Hour, DtNow.Date, DtNow) + 1
    ExpectedRec = HoursLapsed * NumberOfBays
    DataAvbl = TodaysAvbData / ExpectedRec * 100.0
    If DataAvbl > 100.0 Then DataAvbl = 100.0
    LblTodayAvbl.Text = Format(DataAvbl, "0.00") & "%"
    If IsPostBack Then

      Dim CtrlID As String = String.Empty
      If Request.Form("__EVENTTARGET") IsNot Nothing And Request.Form("__EVENTTARGET") <> String.Empty Then
        CtrlID = Request.Form("__EVENTTARGET")
      Else
        'Buttons and ImageButtons
        If Request.Form(hidSourceId.UniqueID) IsNot Nothing And Request.Form(hidSourceId.UniqueID) <> String.Empty Then
          CtrlID = Request.Form(hidSourceId.UniqueID)
        End If
      End If


      If CtrlID = "DropDownList1" Then
        Do While DropDownList2.Items.Count > 0
          DropDownList2.Items.RemoveAt(0)
        Loop
        DropDownList2.Items.Add(New ListItem("<-- Select -->", "0000"))
        DropDownList2.DataSourceID = "SqlDataSource2"
        DropDownList2.DataTextField = "BusNm"
        DropDownList2.DataValueField = "BusId"
        DropDownList2.DataBind()
        Do While DropDownList3.Items.Count > 0
          DropDownList3.Items.RemoveAt(0)
        Loop
        DropDownList3.Items.Add(New ListItem("<-- Select -->", "0000"))
        DropDownList3.DataSourceID = "SqlDataSource3"
        DropDownList3.DataTextField = "BayNm"
        DropDownList3.DataValueField = "BayId"
        DropDownList3.DataBind()
      End If

      If CtrlID = "DropDownList2" Then
        Do While DropDownList3.Items.Count > 0
          DropDownList3.Items.RemoveAt(0)
        Loop
        DropDownList3.Items.Add(New ListItem("<-- Select -->", "0000"))
        DropDownList3.DataSourceID = "SqlDataSource3"
        DropDownList3.DataBind()
      End If


      If CtrlID = "txtDate1" Then
        Dim datex As DateTime = DateTime.ParseExact(Request.Form("txtDate1"), "MM/dd/yyyy", CultureInfo.InvariantCulture)
        Dim reformatted As String = datex.ToString("dd/MM/yy", CultureInfo.InvariantCulture)
        'txtDate1.Text = reformatted
        reformatted = datex.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)
        hdnStart.Value = reformatted
        txtDate1.Text = Request.Form("txtDate1")
        If Not IsDate(txtDate2.Text) Then
          txtDate2.Text = txtDate1.Text
          hdnEnd.Value = hdnStart.Value
        End If
        'CDate(Request.Form("txtDate1")).ToString("MM/dd/yy")
        'ClientScript.RegisterStartupScript(Me.GetType(), "sourceofpostback", "<script type='text/javascript'>" & _
        '                                  "window.onload=new function(){" & "alert('Control ID " & dt.Rows.Count & " caused postback.');}" & "</script>")
      End If

      If CtrlID = "txtDate2" Then
        Dim datey As DateTime = DateTime.ParseExact(Request.Form("txtDate2"), "MM/dd/yyyy", CultureInfo.InvariantCulture)
        Dim reformatted1 As String = datey.ToString("dd/MM/yy", CultureInfo.InvariantCulture)
        'txtDate2.Text = reformatted1
        reformatted1 = datey.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)
        hdnEnd.Value = reformatted1
        txtDate2.Text = Request.Form("txtDate2")
        If Not IsDate(txtDate1.Text) Then
          txtDate1.Text = txtDate2.Text
          hdnStart.Value = hdnEnd.Value
        End If
        'CDate(Request.Form("txtDate1")).ToString("MM/dd/yy")
        'ClientScript.RegisterStartupScript(Me.GetType(), "sourceofpostback", "<script type='text/javascript'>" & _
        '                                  "window.onload=new function(){" & "alert('Control ID " & dt.Rows.Count & " caused postback.');}" & "</script>")
      End If


    Else
      'DropDownList1.Items.Add(New ListItem("<-- Select -->", "0000")) '<-- Select --> is from aspx source
      DropDownList1.DataSourceID = "SqlDataSource1"
      DropDownList1.DataTextField = "SsNm"
      DropDownList1.DataValueField = "SsId"
    End If
  End Sub

  <WebMethod()> _
  Public Shared Function GetChartData(ByVal bid As String, ByVal start1 As String, ByVal end1 As String) As List(Of Object)
    'Dim bid As String = "A7519B5EDD"
    'Dim start1 As String = "2020-02-25"
    'Dim end1 As String = "2020-02-28"

    Dim datex As DateTime = DateTime.ParseExact(end1, "yyyy-MM-dd", CultureInfo.InvariantCulture)
    datex = datex.AddDays(1)
    Dim reformatted As String = datex.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)
    end1 = reformatted



    Dim query As String = "Select Amp, Convert(Varchar,DtTm,20) as DtTm From MfmData020 " & _
      "Where BayId = '" & bid & "' And DtTm > '" & start1 & "' And DtTm < '" & end1 & "' Order By DtTm"
    Dim constr As String
    Dim chartData As New List(Of Object)()
    chartData.Add(New Object() {"DtTm", "Amp"})
    constr = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Using con As New SqlConnection(constr)
      Using cmd As New SqlCommand(query)
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        con.Open()
        Using sdr As SqlDataReader = cmd.ExecuteReader()
          While sdr.Read()
            chartData.Add(New Object() {sdr("DtTm"), sdr("Amp")})
          End While
        End Using
        con.Close()
        Return chartData
      End Using
    End Using
  End Function

  'Gets item (0,0) from the data source having only record count
  Private Function GetNumberOfRecords(ByRef RecCountingDataSource As SqlDataSource) As Integer
    Dim dv As DataView = RecCountingDataSource.Select(DataSourceSelectArguments.Empty)
    Dim dt As DataTable = dv.ToTable
    Dim dr As DataRow = dt.Rows.Item(0)
    GetNumberOfRecords = dr.Item(0)
  End Function

End Class
