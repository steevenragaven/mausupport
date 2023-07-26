<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DetailsPage.aspx.cs" Inherits="mau.DetailsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div id="h" class="row">
            Request Details
        </div>
        <div class="row">
            <div class="col-md-6">
<asp:Image ID="ImageControl" runat="server" />
            </div>
            <div class="col-md-6">
                <h2>Title: <asp:Label ID="TitleLabel" runat="server" /></h2>
                <p>Description: <asp:Label ID="DescriptionLabel" runat="server" /></p>
                <p>Category: <asp:Label ID="CategoryLabel" runat="server" /></p>
                <p>Name: <asp:Label ID="NameLabel" runat="server" /></p>
                <p>Target Donation: <asp:Label ID="TargetDonationLabel" runat="server" /></p>
                <p>Deadline: <asp:Label ID="DeadlineLabel" runat="server" /></p>
                <p>Urgency: <asp:Label ID="UrgencyLabel" runat="server" /></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <asp:Button ID="AuthenticateButton" runat="server" Text="Authenticate" OnClick="AuthenticateButton_Click" CssClass="btn btn-primary" />
            </div>
            <div class="col-md-6">
                <asp:Button ID="RefuseButton" runat="server" Text="Refuse" OnClick="RefuseButton_Click" CssClass="btn btn-danger" />
            </div>
        </div>
    </div>
</asp:Content>