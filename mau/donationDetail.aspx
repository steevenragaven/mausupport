<%@ Page Title="" Language="C#" MasterPageFile="~/donorPortal.Master" AutoEventWireup="true" CodeBehind="donationDetail.aspx.cs" Inherits="mau.donationDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="container my-5" style="width: 500px;">
    <h1 style="text-align:center;"><u>More Detail</u></h1>
    <div class="d-flex align-items-center justify-content-center">

     <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false">

        <Fields>
            <%--<asp:ImageField ControlStyle-Height="500px" DataImageUrlField="IMG1"
                DataImageUrlFormatString="../image/{0}"
                SortExpression="Product image" />--%>




            <asp:TemplateField>

                <ItemTemplate>

                    <!-- Carousel Markup -->
        <div id="carouselExample" class="carousel slide" data-ride="carousel" style="width: 1000px;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carouselExample" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExample" data-slide-to="1"></li>
                <!-- Add more indicators for each image -->
            </ol>

            <!-- Slides -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src='<%# Eval("IMG1") %>' alt="Image 1" style="width: 400px; height: 300px;">
                </div>
                <div class="carousel-item active">
                    <img src='<%# Eval("IMG2") %>' alt="Image 2" style="width: 400px; height: 300px;">
                </div>
                <!-- Add more carousel items for each image -->
            </div>

            <!-- Controls -->
            <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

                    <h5>Title:<strong><em>
                        <%# Eval("TITLE") %>
                    </em></strong></h5>
                    <br />
                    <h5>Category<strong><em>
                        <%# Eval("CATEGORY") %>
                    </em></strong></h5>
                    <h5> Issued by: <strong><em>
                        <%# Eval("U_NAME") %>
                    </em></strong></h5>
                    <div class="description-container">
                        <h5>Description<strong><em>
                            <%# Eval("DESCRIPTIONS") %>
                        </em></strong></h5>
                    </div>
                    <h5>Target Donation<strong><em>
                        <%# Eval("TARGETDONATION") %>
                    </em></strong></h5>
                    <h5>DeadLine:<strong><em>
                        <%# Eval("DEADLINE") %>
                    </em></strong></h5>
                    <h5>Urgency:<strong><em>
                        <%# Eval("URGENCY") %>
                    </em></strong></h5>

                    <h5>Donation Progress:<strong><em>
                        <!--donation progress here-->
                    </em></strong></h5>

                    <div class="space">
                        <asp:Label ID="lbl1" runat="server" Text="Amount Donating:"></asp:Label>
                        <asp:TextBox ID="txtNumber" runat="server" class="form-control" aria-label="default input example"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="txtNumber"
                        ErrorMessage="Please enter only numbers." ValidationExpression="^\d+$" />
                    </div>
                    <br />
                    <div class="space" style="left: 10px;">
                        <asp:Label ID="lbl2" runat="server" Text="Juice Reference:"></asp:Label>
                        <asp:TextBox ID="txtJuice" runat="server" class="form-control" aria-label="default input example"></asp:TextBox>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
                    </div>

                </ItemTemplate>

            </asp:TemplateField>

            

        </Fields>

    </asp:DetailsView>
        </div>
        </div>
</asp:Content>
