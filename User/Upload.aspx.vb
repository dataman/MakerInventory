﻿Imports System.Data
Imports System.Data.SqlClient

Partial Class Upload
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If FileUpload1.HasFile Then
            ' Read Uploaded File
            Dim oStream As System.IO.Stream = FileUpload1.FileContent
            Dim oReader = New System.IO.StreamReader(oStream)
            While oReader.Peek() >= 0
                Dim sLine = oReader.ReadLine
                If sLine.Length > 0 Then
                    If Left(sLine, 1) = "#" Then Continue While
                    ' We have a line of data
                    ' #Part, Qty, Cost, Vendor, SKU, WebPage, Manufacturer, Datasheet 
                    Dim sFields() As String = sLine.Split(",")
                    Dim oCmd As New SqlCommand("spUpdateFromFile")
                    oCmd.CommandType = CommandType.StoredProcedure
                    oCmd.Parameters.Add(New SqlParameter("User", My.User.Name))
                    oCmd.Parameters.Add(New SqlParameter("PartNo", lookup(sFields, 0)))
                    oCmd.Parameters.Add(New SqlParameter("Qty", lookup(sFields, 1)))
                    oCmd.Parameters.Add(New SqlParameter("Cost", lookup(sFields, 2)))
                    oCmd.Parameters.Add(New SqlParameter("Vendor", lookup(sFields, 3)))
                    oCmd.Parameters.Add(New SqlParameter("SKU", lookup(sFields, 4)))
                    oCmd.Parameters.Add(New SqlParameter("URL", lookup(sFields, 5)))
                    oCmd.Parameters.Add(New SqlParameter("Manufacturer", lookup(sFields, 6)))
                    oCmd.Parameters.Add(New SqlParameter("Datasheet", lookup(sFields, 7)))
                    oCmd.Parameters.Add(New SqlParameter("IsUpdate", IIf(chkOverWrite.Checked, "Y", "N")))
                    Call ExecSQL(oCmd)
                End If
            End While
            oReader.Close()
            oStream.Close()
        End If
    End Sub

    Private Function lookup(data As String(), index As Integer) As Object
        Try
            Return data(index).ToString.Trim
        Catch
        End Try
        Return ""
    End Function

    Private Function ExecSQL(oCmd As SqlCommand) As Object
        Dim oCN As New SqlConnection(ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        oCN.Open()
        oCmd.Connection = oCN
        Return oCmd.ExecuteScalar()
    End Function

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
        Dim vbCRLF As String = Chr(13) & Chr(10)
        Response.Clear()
        Response.ClearHeaders()
        Response.AddHeader("content-disposition", "attachment; filename=testfile.csv")
        Response.AddHeader("content-type", "text/csv")
        'Response.ContentType = "text/plain"
        'Response.Charset = String.Empty
        Response.Write("# Export from MakerInventory for " & My.User.Name & " on " & DateTime.Today.ToString & vbCRLF)
        Response.Write("# Part, Qty, Cost, Vendor, SKU, WebPage, Manufacturer, Datasheet" & vbCRLF)
        Dim oCN As New SqlConnection(ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)
        oCN.Open()
        Dim oCMD As New SqlCommand("SELECT * From vwInventoryAll Where UserName=@UserName", oCN)
        oCMD.Parameters.Add(New SqlParameter("UserName", My.User.Name))
        Dim oDR As SqlDataReader = oCMD.ExecuteReader()
        While oDR.Read()
            Response.Write(oDR("PartNo").ToString & "," & _
                            oDR("Qty").ToString & "," & _
                            oDR("Cost").ToString & "," & _
                            ",,," & _
                            oDR("Manufacturer").ToString & "," & _
                            oDR("DataSheet").ToString & vbCRLF)
        End While
        oDR.Close()
        oCN.Close()
        Response.End()
    End Sub

End Class
