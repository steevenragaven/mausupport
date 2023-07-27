<%@ Page Title="" Language="C#" MasterPageFile="~/donorPortal.Master" AutoEventWireup="true" CodeBehind="payment_success.aspx.cs" Inherits="mau.payment_success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .main{
            height: 80vh;
            width: 100vw;
            display: grid;
            justify-content: center;
            align-items: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="main">
        <div>
            <div>
                <img src="image/success.png" />
            </div>
            <div>
                <a href="donorView.aspx">Back</a>
            </div>
        </div>
    </div>

</asp:Content>
