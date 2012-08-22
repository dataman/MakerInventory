
Partial Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Session("Search") Is Nothing Then
            txtSearch.Text = Session("Search")
            Session("Search") = Nothing
            Button3_Click(Me, e)
        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        Page.DataBind()
    End Sub

End Class
