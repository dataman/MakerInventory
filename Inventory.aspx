﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Inventory.aspx.vb" Inherits="Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        Maker Name:
        <asp:DropDownList ID="ddSearch" runat="server" DataSourceID="dsUser" 
            DataTextField="UserName" DataValueField="UserId">
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="GO" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="dsInv" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="PartID" 
                    DataNavigateUrlFormatString="Part.ASPX?ID={0}" DataTextField="PartNo" 
                    HeaderText="PartNo" SortExpression="PartNo" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" 
                    SortExpression="Manufacturer" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" 
                    SortExpression="Qty" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" 
                    SortExpression="Cost" />
                <asp:HyperLinkField DataNavigateUrlFields="Datasheet" HeaderText="Datasheet" 
                    Target="Datasheet" DataTextField="DataSheet" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="dsUser" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT [UserName], [UserId] FROM [vw_aspnet_Users]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsInv" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            
            
            
            SelectCommand="SELECT PartID, [PartNo], [Manufacturer], [Qty], [Cost], [DataSheet], [UserID] FROM [vwInventory] WHERE ([UserID] = @UserID) ORDER BY [PartNo]">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddSearch" Name="UserID" 
                    PropertyName="SelectedValue" Type="Object" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

