<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg.aspx.cs" Inherits="mau.reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
            <div>

              <div class="row">
                <div class="col-md-6 mb-4">

                  <div class="form-outline">
                                    <asp:TextBox runat="server" ID="txtfname"
                                        CssClass="form-control" />
                                    <asp:Label runat="server"
                                        CssClass="form-label">First Name</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="txtfname"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*First Name is required*">
                                    </asp:RequiredFieldValidator>
                  </div>

                    <div class="form-outline">
                         <asp:TextBox runat="server" ID="txtusername" CssClass="form-control" />
                                    <asp:Label runat="server" CssClass="form-label">Username</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="txtusername"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*Username is required*">
                                    </asp:RequiredFieldValidator>

                    </div>

                </div>
                <div class="col-md-6 mb-4">

                  <div class="form-outline">
                                    <asp:TextBox runat="server" ID="txtlname"
                                        CssClass="form-control" />
                                    <asp:Label runat="server"
                                        CssClass="form-label">Last Name</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtlname"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*Last Name is required*">
                                    </asp:RequiredFieldValidator>
                  </div>

                    
                        <div class="form-outline">
                                    <asp:TextBox runat="server" ID="txtNIC" CssClass="form-control" />
                                    <asp:Label runat="server" CssClass="form-label">NIC</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                        ControlToValidate="txtNIC"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*NIC is required*">
                                    </asp:RequiredFieldValidator>
                            </div>
                    </div>

                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 d-flex align-items-center">

                  <div class="form-outline datepicker w-100">
                      
                    <div class="form-outline datepicker">
                                        <asp:TextBox runat="server" ID="txtdob" CssClass="form-control" TextMode="Date"  />
                                        <asp:RangeValidator ID="rvdob" runat="server"
                                            ControlToValidate="txtdob"
                                            ErrorMessage="*Your age do not match our requirements*"></asp:RangeValidator>
                                        <asp:Label runat="server" CssClass="form-label">Date Of Birth</asp:Label>

                     </div>
                  </div>

                </div>
                <div class="col-md-6 mb-4">

                  <h6 class="mb-2 pb-1">You want to be a: </h6>
                    <asp:Label ID="Label1" runat="server" class="form-check-label" Text="Client"></asp:Label>
                  <asp:RadioButton class="form-check-input" ID="Client" runat="server" Text="" GroupName="RadioButtonGroup" />
                    <asp:Label ID="Label2" runat="server" class="form-check-label" Text="Donor"></asp:Label>
                  <asp:RadioButton class="form-check-input" ID="Donor" runat="server" Text="" GroupName="RadioButtonGroup" />


                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 pb-2">

                  <div class="form-outline">
                    
                      <asp:TextBox runat="server" ID="txtmail" CssClass="form-control" />
                                    <asp:Label runat="server" CssClass="form-label">Email</asp:Label>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="txtmail"
                                            ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+[.])+[a-z]{2,5}$"
                                            ErrorMessage="*Incorrect Email*">
                                     </asp:RegularExpressionValidator>
                  </div>

                </div>
                <div class="col-md-6 mb-4 pb-2">

                  <div class="form-outline">
                   <asp:TextBox runat="server" ID="txtphone" CssClass="form-control" />
                                    <asp:Label runat="server" CssClass="form-label">Phone number</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                        ControlToValidate="txtphone"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*Phone number is required*">
                                    </asp:RequiredFieldValidator>
                  </div>

                </div>
                  <div class="col-md-6 mb-4 pb-2">
                      
                          <div class="form-outline">
                              <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" type="password" />
                                    <asp:Label runat="server" CssClass="form-label">Password</asp:Label>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="txtpassword"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*Password is required*">
                                    </asp:RequiredFieldValidator>
                        </div>
                  </div>
                  <div class="col-md-6 mb-4 pb-2">
                      
                          <div class="form-outline">
                              <asp:TextBox ID="Password2" class="form-control" runat="server"></asp:TextBox>
                                    <label class="form-label" for="form3Example1q">Repeat Password</label>
                              <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToCompare="txtpassword"
                                        ControlToValidate="Password2"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ErrorMessage="*Passwords fields do not match*">
                                    </asp:CompareValidator>
                        </div>
                  </div>
              </div>

             

              <div class="mt-4 pt-2">
                  <asp:Button ID="submitBtn" runat="server" class="btn btn-primary btn-lg" Text="Submit" OnClick="submitBtn_Click" />
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
