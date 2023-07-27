<%@ Page Title="" Language="C#" MasterPageFile="~/donorPortal.Master" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="mau.email" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">Confirm your information</h2>
              <p class="text-white-50 mb-5">Please enter your username and email!</p>

              <div class="form-outline form-white mb-4">
                <asp:TextBox ID="txtUsername" runat="server" class="form-control form-control-lg" ></asp:TextBox>
                <asp:Label ID="lblusername" runat="server" Text="Username" class="form-label"></asp:Label>
              </div>

              <div class="form-outline form-white mb-4">
                <asp:TextBox ID="txtEmail" runat="server" class="form-control form-control-lg" ></asp:TextBox>
                <asp:Label ID="lblemail" runat="server" Text="Email" class="form-label"></asp:Label>
              </div>

              <div class="form-outline form-white mb-4">
                <asp:TextBox ID="txtpwd" runat="server" class="form-control form-control-lg" ></asp:TextBox>
                <asp:Label ID="lblpwd" runat="server" Text="Password" class="form-label"></asp:Label>
              </div>

                <asp:Button ID="confirmbtn" runat="server" Text="Confirm" class="btn btn-outline-light btn-lg px-5" OnClick="confirmbtn_Click" />
                
            </div>
                <asp:Label ID="lblmsg" runat="server" Text="" class="form-label" ></asp:Label>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</asp:Content>
