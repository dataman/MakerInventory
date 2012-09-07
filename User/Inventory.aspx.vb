Imports System.Data.SqlClient

Partial Class Inventory
    Inherits System.Web.UI.Page

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        dsInv.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then ddSearch.DataBind()
        If Not Session("UserSearch") Is Nothing Then
            ddSearch.ClearSelection()
            For i As Integer = 0 To ddSearch.Items.Count - 1
                If ddSearch.Items(i).Text = Session("UserSearch") Then
                    ddSearch.Items(i).Selected = True
                    Exit For
                End If
            Next
            Session("UserSearch") = Nothing
            btnSearch_Click(Me, e)
        End If
        If Not Session("Search") Is Nothing Then
            ddSearch.SelectedValue = Session("Search")
            Session("Search") = Nothing
            btnSearch_Click(Me, e)
        End If
    End Sub

End Class
