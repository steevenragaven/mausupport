<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="mau.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="StyleSheet1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div id="h" class="row">
            List of Requests
        </div>
        <div class="row">
            <asp:GridView ID="RequestGridView" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="RequestGridView_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="TITLE" HeaderText="Title" />
                    <asp:BoundField DataField="DESCRIPTIONS" HeaderText="Description" />
                    <asp:BoundField DataField="CATEGORY" HeaderText="Category" />
                    <asp:BoundField DataField="U_NAME" HeaderText="Name" />
                    <asp:BoundField DataField="TARGETDONATION" HeaderText="Target Donation" />
                    <asp:BoundField DataField="DEADLINE" HeaderText="Deadline" />
                    <asp:BoundField DataField="URGENCY" HeaderText="Urgency" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
