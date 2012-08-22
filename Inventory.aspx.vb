
Partial Class Inventory
    Inherits System.Web.UI.Page

    Protected Sub btnSearch_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        dsInv.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not Session("Search") Is Nothing Then
            ddSearch.SelectedValue = Session("Search")
            Session("Search") = Nothing
            btnSearch_Click(Me, e)
        End If
    End Sub

End Class
