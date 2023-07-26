<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="mau.client1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help Request Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            background-color: #FF6347;
            padding: 20px;
            border-radius: 5px;
            color: aliceblue;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2 style="color:#ffd700">Help Request Form</h2>
        <div>
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <asp:TextBox runat="server" ID="fullNameTextBox" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox runat="server" ID="emailTextBox" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <asp:TextBox runat="server" ID="phoneNumberTextBox" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="requestDetails">Request Details</label>
                <asp:TextBox runat="server" ID="requestDetailsTextBox" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Enter the details of your help request"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="deadline">Deadline</label>
                <asp:TextBox runat="server" ID="deadline" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="hasChildren">Do you have children?</label>
                <div class="form-check">
                    <asp:RadioButton runat="server" ID="childrenYes" GroupName="hasChildren" Value="yes" Text="Yes" />
                    <label class="form-check-label" for="childrenYes">Yes</label>
                </div>
                <div class="form-check">
                    <asp:RadioButton runat="server" ID="childrenNo" GroupName="hasChildren" Value="no" Text="No" />
                    <label class="form-check-label" for="childrenNo">No</label>
                </div>
            </div>

            <div class="form-group">
                <label for="relationshipStatus">Relationship Status</label>
                <asp:DropDownList runat="server" ID="relationshipStatus" CssClass="form-control">
                    <asp:ListItem Text="Single"></asp:ListItem>
                    <asp:ListItem Text="Married"></asp:ListItem>
                    <asp:ListItem Text="Divorced"></asp:ListItem>
                    <asp:ListItem Text="Widowed"></asp:ListItem>
                    <asp:ListItem Text="In a Relationship"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="proofMedia">Proof (Media)</label>
                <asp:FileUpload runat="server" ID="proofMedia" CssClass="form-control" Multiple />
            </div>

            <div class="form-group">
                <label for="selectedFiles">Selected Files:</label>
                <ul id="selectedFiles" runat="server"></ul>
            </div>

            <asp:Button runat="server" ID="SubmitButton" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
        </div>
    </div>

    <script>
        const proofMediaInput = document.getElementById('<%= proofMedia.ClientID %>');
        const selectedFilesList = document.getElementById('<%= selectedFiles.ClientID %>');

        proofMediaInput.addEventListener('change', (event) => {
            selectedFilesList.innerHTML = '';
            const files = Array.from(event.target.files);
            files.forEach(file => {
                const listItem = document.createElement('li');
                listItem.textContent = file.name;
                selectedFilesList.appendChild(listItem);
            });
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
</asp:Content>
