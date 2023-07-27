<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="Notications.aspx.cs" Inherits="mau.Notications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Notifications</h1>
        <ul>
            <asp:Literal ID="notificationsList" runat="server"></asp:Literal>
        </ul>
    </div>
</asp:Content>

