<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="mainMenu.aspx.cs" Inherits="WebApplicationFinal.admin.mainMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Basic Main Menu-->
    <div class="container">

        <div class="well">
            <h1 class="bg-primary text-center">Main Menu</h1>
            <p class="lead text-center" >This Is Where You Can Navigate Your Account</p>
            <h3 class="bg-warning text-center"><a href="workouts.aspx">Click Here for Your Workout List Page</a></h3>
            <h3 class="bg-warning text-center"><a href="/addWorkout.aspx">Click Here To Add Your Workout</a></h3>
            <h3 class="bg-warning text-center"><a href="accountSettings.aspx">Account Settings</a></h3>
            
        </div>
    </div>

</asp:Content>
