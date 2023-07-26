<%@ Page Title="" Language="C#" MasterPageFile="~/donorPortal.Master" AutoEventWireup="true" CodeBehind="donorView.aspx.cs" Inherits="mau.donorView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
   <%--<div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Card 1 Title</h3>
                    </div>
                    <div class="panel-body">
                        <p>This is the content of Card 1.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Card 1 Title</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-4">
                    <img src="path/to/your/image.jpg" class="img-responsive" alt="Card Image">
                </div>
                <div class="col-xs-8">
                    <p>This is the content of Card 1.</p>
                </div>
            </div>
        </div>
    </div>
</div>

        </div>
    </div>--%>
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
    <%--<asp:GridView
            ID="GrdView1"
            AutoGenerateColumns="false"
              OnPageIndexChanging="GrdView1_PageIndexChanging"
            AllowPaging="true"
              BackColor="White"
             CellSpacing="50"
            PageSize="3"
            CellPadding="50"
            runat="server">
            <Columns>
                <asp:ImageField DataImageUrlField="IMG"
                    DataImageUrlFormatString="../image/{0}"
                    HeaderText="Hotel image" SortExpression="IMG"
                    ControlStyle-Width="300" />
                <asp:BoundField HeaderText="Hotel Name" DataField="HOTEL_NAME" />
                                
                <asp:TemplateField HeaderText="Product Price">
                    <ItemTemplate>
                        <h5>
                            <%# Eval("PRICING","{0:c}") %>
                        </h5>
                    </ItemTemplate>
                </asp:TemplateField>
<asp:HyperLinkField HeaderText="Details" DataTextField="HOTEL_NAME" DataNavigateUrlFields="ID"
                                    DataNavigateUrlFormatString="hoteldetail.aspx?id={0}" />
                
            </Columns>
        </asp:GridView>--%>

</asp:Content>