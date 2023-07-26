<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="donr.aspx.cs" Inherits="mau.donr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <div class="container">
        <div class="row">
            <div class="col-md-4">
<asp:Repeater ID="MyRepeater" runat="server">
    <ItemTemplate>
        <div class="card">
            <div class="card-body">
                <h3 class="card-title"><%# Eval("TITLE") %></h3>
                <p class="card-text">Description: <%# Eval("DESCRIPTIONS") %></p>
                <p class="card-text">Category: <%# Eval("CATEGORY") %></p>
                <p class="card-text">User Name: <%# Eval("U_NAME") %></p>
                <p class="card-text">Client ID: <%# Eval("C_ID") %></p>
                <p class="card-text">Target Donation: <%# Eval("TARGETDONATION") %></p>
                <p class="card-text">Deadline: <%# Eval("DEADLINE") %></p>
                <p class="card-text">Urgency: <%# Eval("URGENCY") %></p>
                <p class="card-text">Is Active: <%# Eval("ISACTIVE") %></p>
            </div>
        </div>
        <br />
    </ItemTemplate>
</asp:Repeater>
                     </div>
                
         </div>
    </div>
</asp:Content>
