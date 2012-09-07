
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles btnSearch.Click
        Session("Search") = txtSearch.Text
        Server.Transfer("~/User/Search.ASPX")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Session("Search") = ddUserID.SelectedValue
        Server.Transfer("~/User/Inventory.ASPX")
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Server.Transfer("~/User/Upload.ASPX")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
        Session("Search") = Nothing
        Session("UserSearch") = My.User.Name
        Server.Transfer("~/User/Inventory.ASPX")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            If Not My.User.IsAuthenticated Then Server.Transfer("Error.ASPX")
        End If
        If My.User.IsAuthenticated Then hdUser.Value = My.User.Name : Page.DataBind()
    End Sub
End Class
