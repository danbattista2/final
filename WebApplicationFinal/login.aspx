<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplicationFinal.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Basic Log in Page with text fields and button-->
    <h1 class="bg-primary text-center">Login To Workout Tracker</h1>

    
    <div>
        <asp:Label ID="lblStatus" runat="server" CssClass="label label-danger" />
    </div>

    <div class="form-group">
        <label for="Username" class="col-sm-2">Username:</label>
        <asp:TextBox ID="txtUsername" runat="server" />
    </div>

    <div class="form-group ">
        <label for="txtPassword" class="col-sm-2">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
    </div>

    <div class="btnLogin col-sm-offset-2" runat="server" text="Login">
    <asp:Button CssClass="btn btn-success" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </div>



</asp:Content>
