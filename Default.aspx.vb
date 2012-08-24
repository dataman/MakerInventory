
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        Session("Search") = txtSearch.Text
        Server.Transfer("Search.ASPX")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Session("Search") = ddUserID.SelectedValue
        Server.Transfer("Inventory.ASPX")
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Server.Transfer("Upload.ASPX")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
        If Not My.User.IsAuthenticated Then Return
        Session("Search") = My.User.Name.ToString
        Server.Transfer("Inventory.ASPX")
    End Sub

End Class
