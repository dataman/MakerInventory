<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Part.aspx.vb" Inherits="Part" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        Part Detail:<asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PartID" 
            DataSourceID="dsPart" GridLines="Horizontal" Height="50px" 
            Width="125px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:BoundField DataField="PartID" HeaderText="PartID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="PartID" />
                <asp:BoundField DataField="PartNo" HeaderText="PartNo" 
                    SortExpression="PartNo" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" 
                    ReadOnly="True" SortExpression="Manufacturer" />
                <asp:HyperLinkField DataNavigateUrlFields="Datasheet" 
                    DataNavigateUrlFormatString="{0}" DataTextField="Datasheet" 
                    HeaderText="Datasheet" />
                <asp:BoundField DataField="KitID" HeaderText="KitID" SortExpression="KitID" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <br />
        Your history of this part:<asp:GridView ID="GridView2" runat="server" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="LogID" 
            DataSourceID="dsHistory" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="DateTime" HeaderText="DateTime" 
                    SortExpression="DateTime" />
                <asp:BoundField DataField="Vendor" HeaderText="Vendor" 
                    SortExpression="Vendor" />
                <asp:BoundField DataField="SKU" HeaderText="SKU" SortExpression="SKU" />
                <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                <asp:BoundField DataField="CostEA" HeaderText="CostEA" 
                    SortExpression="CostEA" />
            </Columns>
            <EmptyDataTemplate>
                No history of this part.
            </EmptyDataTemplate>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <br />
        Makers with this part:<asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="dsMakers" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" ReadOnly="True" 
                    SortExpression="Qty" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" ReadOnly="True" 
                    SortExpression="Cost" />
            </Columns>
            <EmptyDataTemplate>
                No makers with this part.
            </EmptyDataTemplate>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="dsPart" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT PartID, PartNo, (select value from lookup l where l.lookupid=p.ManufacturerID) as Manufacturer,
Datasheet, KitID
FROM [Part] P WHERE (P.[PartID] = @PartID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="hdId" Name="PartID" PropertyName="Value" 
                    Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsMakers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [UserID],
(Select UserName from aspnet_users U where U.UserID = I.UserID) as [UserName], 
 [Qty], [Cost] FROM [vwInventory] I WHERE ([PartId] = @PartId) ORDER BY [UserID]">
            <SelectParameters>
                <asp:ControlParameter ControlID="hdId" Name="PartId" PropertyName="Value" 
                    Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsHistory" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT [LogID], [DateTime], v.Value as Vendor, [SKU], [URL], [Qty], [CostEA] 
FROM [Log] L
inner join aspnet_users u on l.userid = u.userid
inner join lookup v on l.vendorid = v.lookupid
WHERE ([PartID] = @PartID)
and u.username = @User
order by DateTime Desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="hdId" Name="PartID" PropertyName="Value" 
                    Type="Int64" />
                <asp:ControlParameter ControlID="hdUser" Name="User" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hdId" runat="server" />
        <asp:HiddenField ID="hdUser" runat="server" />
    </p>
</asp:Content>

