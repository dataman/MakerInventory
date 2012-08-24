
Partial Class Part
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not Request("ID") Is Nothing Then
            hdID.Value = Request("ID")
            Page.DataBind()
        End If
    End Sub
End Class
