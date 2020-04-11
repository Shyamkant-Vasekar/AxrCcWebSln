
Partial Class WriteMfmData
    Inherits System.Web.UI.Page

  Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    'Variables to be written in database tables
    Dim BayID As String
    Dim BayNm As String
    Dim Amp As Double
    Dim Mw As Double
    Dim Mvar As Double
    Dim MwhI As Double
    Dim MwhE As Double

    'Components to write in database table
    Dim connectionstr As String
    Dim Connection As System.Data.SqlClient.SqlConnection
    Dim Command As Data.SqlClient.SqlCommand
    Dim DataAdapter As New Data.SqlClient.SqlDataAdapter
    Dim SQL As String
    Dim Output As String = ""

    'For date formating suitable for MS SQL SERVER
    Dim UtcDtTm As Date
    Dim IsDtTm As Date
    Dim DtTmStr As String

    UtcDtTm = Date.UtcNow()
    IsDtTm = UtcDtTm.AddHours(5)
    IsDtTm = IsDtTm.AddMinutes(30)

    DtTmStr = IsDtTm.Year.ToString("0000") & "-" & IsDtTm.Month.ToString("00") & "-" & IsDtTm.Day.ToString("00") & " " & Str(IsDtTm.Hour) & ":" & IsDtTm.Minute.ToString("00") & ":" & IsDtTm.Second.ToString("00")

    'Get data
    BayID = Request.QueryString("BayID")
    BayNm = Request.QueryString("BayNm")
    Amp = Request.QueryString("Amp")
    Mw = Request.QueryString("Mw")
    Mvar = Request.QueryString("Mvar")
    MwhI = Request.QueryString("MwhI")
    MwhE = Request.QueryString("MwhE")


    Dim executed As Boolean = False
    Try

      connectionstr = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

      SQL = "INSERT INTO MfmData000 (DtTm, BayID, BayNm, Amp, Mw, Mvar, MwhI, MwhE) VALUES ( '" & DtTmStr & "', '" & BayID & "', '" & BayNm & "', " & Amp & ", " & Mw & ", " & Mvar & ", " & MwhI & ", " & MwhE & " )"

      Response.Write(SQL)
      Connection = New Data.SqlClient.SqlConnection(connectionstr)
      Connection.Open()
      Command = New Data.SqlClient.SqlCommand(SQL, Connection)
      DataAdapter.InsertCommand = New Data.SqlClient.SqlCommand(SQL, Connection)
      DataAdapter.InsertCommand.ExecuteNonQuery()
      Command.Dispose()
      Connection.Close()
      Connection.Dispose()
      executed = True
    Catch ex As Exception
    End Try

    ''In arduino program response handeling could not be implemented
    'If executed Then
    '  Response.Redirect("SuccessPg.html")
    'Else
    '  Response.Redirect("ErrPg.html")
    'End If

  End Sub
End Class
