<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPwd.aspx.cs" Inherits="mau.regPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="container d-flex flex-column">
      <div class="row align-items-center justify-content-center
          min-vh-100">
        <div class="col-12 col-md-8 col-lg-4">
          <div class="card shadow-sm">
            <div class="card-body">
              <div class="mb-4">
                <h5>Forgot Password?</h5>
                <p class="mb-2">Enter your registered email ID to reset the password
                </p>
              </div>
              <div>
                <div class="mb-3">
                    <asp:TextBox runat="server" ID="txtmail" CssClass="form-control" />
                                    <asp:Label runat="server" CssClass="form-label">Email</asp:Label>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="txtmail"
                                            ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+[.])+[a-z]{2,5}$"
                                            ErrorMessage="*Incorrect Email*">
                                     </asp:RegularExpressionValidator>
                </div>
                  <div class="mb-3">
                      <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" type="password" />
                                    <asp:Label runat="server" CssClass="form-label">Password</asp:Label>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="txtpassword"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*Password is required*">
                                    </asp:RequiredFieldValidator>
                  </div>
                  <div class="mb-3">
                      <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" type="password" />
                                    <asp:Label runat="server" CssClass="form-label">Confirm Password</asp:Label>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtpassword"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*Password is required*">
                                    </asp:RequiredFieldValidator>
                  </div>
                  <div>
                      <asp:Label ID="lblError" runat="server" Text="" ></asp:Label><br />
                    </div>
                <div class="mb-3 d-grid">
                     <asp:Button ID="resetBtn" runat="server" class="btn btn-primary btn-lg" Text="Reset Password" OnClick="resetBtn_Click" />
                </div>
                <span>Don't have an account? <a href="reg.aspx">sign in</a></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
        </div>
    </form>
</body>
</html>
