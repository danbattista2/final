<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplicationFinal.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1 class="bg-primary text-center">Register Here for your Workout Tracker</h1>

    <!--Basic Registration Form with textboxes for user to enter information -->
    <h5 class="col-sm-offset-2">All fields are required</h5>

    <div class="form-group-lg col-sm-offset-2">
        <asp:Label ID="lblStatus" runat="server" CssClass="label label-info" />
    </div><br />

    <div class="form-group">
        <label for="txtUsername" class="col-sm-2">Username:</label>
        <asp:TextBox ID="txtUsername" runat="server" />
    </div>

    <div class ="form-group">
        <label for="txtPassword" class="col-sm-2">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="password" />
    </div>

    <div class="form-group">
        <label for="txtConfirm" class="col-sm-2">Confirm:</label>
        <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" />
        <asp:CompareValidator runat="server" ControlToValidate="txtPassword" ControlToCompare="txtConfirm"
             operator="Equal" errorMessage="passwords must match" CssClass="label label-danger" />

    </div>
    <div class="btnRegister col-sm-offset-2" runat="server" text="Register" cssclass="btn btn-primary" > 
    <asp:Button CssClass="btn btn-success" ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    </div>


</asp:Content>
