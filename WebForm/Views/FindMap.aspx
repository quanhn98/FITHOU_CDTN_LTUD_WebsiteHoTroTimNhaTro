<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindMap.aspx.cs" Inherits="WebForm.Views.FindMap" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title id="DetailTitle" runat="server">Tìm kiếm trên bản đồ</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .main-content .container {
            width: 100% !important;
        }
    </style>
    <div>
        <div>
        </div>
        <div id="map">
        </div>
    </div>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var map = document.getElementById("map");

    </script>
</asp:Content>
