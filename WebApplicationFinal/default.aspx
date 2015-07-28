<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplicationFinal._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="bg-primary text-center">Welcome to Workout Tracker</h1>
    <div class="well">
        <!--Simple default page with text -->
        <p class="lead text-center">Weclome to Workout Tracker - Sign up now to start tracking your workouts today!!</p>
        <asp:Image CssClass="center-block" runat="server" Height="420" Width="300" ImageUrl="/images/workout.png"/>
        <p class="lead text-center">Click <a href="/register.aspx">Register</a> To Get an Account</p>
        <p class="lead text-center">Click <a href="/login.aspx">Login</a> To Login If You Have An Account</p>
    </div>
</asp:Content>
