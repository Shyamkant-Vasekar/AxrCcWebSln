
Imports System.Data
Imports System.Web.Services
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class VB
    Inherits System.Web.UI.Page

  <WebMethod()> _
  Public Shared Function GetChartData() As List(Of Object)
    Dim query As String = "Select Amp, Convert(Varchar,DtTm,20) as DtTm From MfmData020 Where BayId = 'A7519B5EDD' And DtTm > '2020-02-23' And DtTm < '2020-03-01' Order By DtTm"
    'Dim query As String = "Select Amp, Convert(Varchar,DtTm,20) as DtTm From MfmData020 " & _
    '  "Where BayId = '" & bid & "' And DtTm > '" & start1 & "' And DtTm < '" & end1 & "' Order By DtTm"
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
End Class
