﻿<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
    Welcome to Maker Inventory!
    </h2>
    <p>
    Recent changes to the inventory...<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="DateTime" HeaderText="Date" 
                    SortExpression="DateTime" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="PartNo" HeaderText="PartNo" 
                    SortExpression="PartNo" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" 
                    SortExpression="Manufacturer" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" ReadOnly="True" 
                    SortExpression="Qty" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" ReadOnly="True" 
                    SortExpression="Cost" />
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
    <br />
        <strong>What do you want to do today?</strong><br />
    </p>
    Search for a part?&nbsp;
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="GO" /><br />

    <br />
    Browse other Maker's Inventories?&nbsp;
    <asp:DropDownList ID="ddUserID" runat="server" DataSourceID="SqlDataSource2" 
        DataTextField="UserName" DataValueField="UserId">
    </asp:DropDownList>&nbsp;<asp:Button ID="Button2" runat="server" Text="GO" />    <br />
    <br />
    Upload my inventory changes?
    &nbsp;<asp:Button ID="Button5" runat="server" Text="GO" />
&nbsp;<br />
    <br />
    Broswe my inventory?&nbsp;
    <asp:Button ID="Button4" runat="server" Text="GO" />    <br />
    <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
    SelectCommand="spLastActivity" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="hdUser" Name="User" PropertyName="Value" 
            Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        
        SelectCommand="SELECT [UserName], [UserId] FROM Settings ORDER BY [UserName]">
    </asp:SqlDataSource>
    <asp:HiddenField ID="hdUser" runat="server" Value="PUBLIC" />
</asp:Content>