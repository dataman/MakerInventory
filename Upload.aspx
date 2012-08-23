<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Upload.aspx.vb" Inherits="Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        This screen allows makers to upload changes to inventory.<br />
        <br />
        The change file is a simple text file in the format:<br />
        Part, Qty, Cost, Vendor, SKU, WebPage, Manufacturer, Datasheet<br />
        <br />
        Lines beginning wtih # are ignored.<br />
        Webpage and Datasheet are considered URL safe.<br />
        <br />
        Typically first line of the file is:<br />
        #Part, Qty, Cost, Vendor, SKU, WebPage, Manufacturer, Datasheet<br />
        You can download a starter file here: <a href="UploadFile.TXT" target="_blank">UploadFile.TXT</a><br />
        <br />
        Sample:
        <br />
        #Part, Qty, Cost, Vendor, SKU, WebPage, Manufacturer, Datasheet
        <br />
        RESISTOR 10 ohm 1/4W CARBON, 10, 0.028<br />
        Which uploads to the part, qty, and cost.<br />
        Vendor, SKU, WebPage, Manufacturer and Datasheet have not be specified.<br />
        <br />
        Please include all fields if uploading a new part.<br />
        Please match part descriptions when updating existing items.<br />
        <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp; <asp:Button ID="Button3" runat="server" Text="GO" />
        <br />
        <br />
        </asp:Content>

