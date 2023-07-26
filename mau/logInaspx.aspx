<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logInaspx.aspx.cs" Inherits="mau.logInaspx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <section class="vh-100 gradient-custom" >
  <div class="container py-5 h-100" >
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-white text-dark" style="border-radius: 1rem;">
            <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="/image/logo.jpg"
                    style="width: 185px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">We are The MauSupport Team</h4>
                </div>

                <div>
                  <p>Please login to your account</p>


                  <div class="form-outline mb-4">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    <label class="form-label" for="form2Example11">Username</label> 
                  </div>

                    
                  <div class="form-outline mb-4">
                    
                      <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" type="password" />
                    <label class="form-label" for="form2Example22">Password</label>
                      
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                     <asp:Button ID="btnLogin"  OnClick="btnLogin_Click" runat="server"
                                CssClass="btn btn-outline-primary" Text="Log in" />
                    <a class="text-muted" href="resetPwd.aspx">Forgot password?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Don't have an account?</p>
<a href="reg.aspx" class="btn btn-outline-danger">Create new</a>

                  </div>
                    <div>
                     <asp:Label ID="lblError" runat="server" Text="" ></asp:Label><br />
                    </div>

                </div>

              </div>
        </div>
      </div>
    </div>
  </div>
</section>
        </div>
    </form>
</body>
</html>
