<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="clients.aspx.cs" Inherits="mau.clients" %>
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
        <form>
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" name="fullNameTextBox" placeholder="Enter your full name">
                    

            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" placeholder="Enter your email">
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="tel" class="form-control" id="phoneNumber" placeholder="Enter your phone number">
            </div>

            <div class="form-group">
                <label for="requestDetails">Request Details</label>
                <textarea class="form-control" id="requestDetails" rows="5"
                    placeholder="Enter the details of your help request"></textarea>
            </div>

            <div class="form-group">
                <label for="deadline">Deadline</label>
                <input type="date" class="form-control" id="deadline">
            </div>

            <div class="form-group">
                <label for="hasChildren">Do you have children?</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="hasChildren" id="childrenYes" value="yes">
                    <label class="form-check-label" for="childrenYes">Yes</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="hasChildren" id="childrenNo" value="no">
                    <label class="form-check-label" for="childrenNo">No</label>
                </div>
            </div>

            <div class="form-group">
                <label for="relationshipStatus">Relationship Status</label>
                <select class="form-control" id="relationshipStatus">
                    <option>Single</option>
                    <option>Married</option>
                    <option>Divorced</option>
                    <option>Widowed</option>
                    <option>In a Relationship</option>
                </select>
            </div>

            <div class="form-group">
                <label for="proofMedia">Proof (Media)</label>
                <input type="file" class="form-control-file" id="proofMedia" multiple>
            </div>

            <div class="form-group">
                <label for="selectedFiles">Selected Files:</label>
                <ul id="selectedFiles"></ul>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <script>
        const proofMediaInput = document.getElementById('proofMedia');
        const selectedFilesList = document.getElementById('selectedFiles');

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
