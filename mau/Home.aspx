<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="mau.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <nav style="background-color:#FF6347;" class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Mausupport</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                   
                    <li class="nav-item">
                        <a class="nav-link" href="logInaspx.aspx">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reg.aspx">Sign up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

   <div class="container mt-4">
    <h1>Welcome to MauSupport</h1>
    <p>MauSupport is a platform dedicated to providing assistance and support to individuals in need. Our mission is to connect those who require help with generous volunteers who are ready to lend a hand.</p>
    <p>Whether you need assistance with daily tasks, household chores, or emotional support, MauSupport is here for you. Simply submit a help request, and our dedicated community of volunteers will strive to fulfill your needs.</p>
    <p>Together, we can make a difference and create a supportive environment where everyone feels valued and cared for.</p>
    <a href="reg.aspx" class="btn btn-primary">Get Started</a>
</div>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
