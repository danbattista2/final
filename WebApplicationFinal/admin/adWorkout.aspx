<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="adWorkout.aspx.cs" Inherits="WebApplicationFinal.admin.adWorkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="bg-primary text-center">Workouts Details</h1>
    <h5 class="col-sm-offset-2">All fields are required</h5>
    <br />

    <!--Text Box fields so user can enter their workout information, all fields are validated-->
    <fieldset>
        <label for="txtName" class="col-sm-2">Name:</label>
        <asp:TextBox ID="txtName" runat="server" required MaxLength="50" />
        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtName"
             ErrorMessage="No Numbers Allowed" ValidationExpression="^[a-zA-Z'.\s]{1,40}$" CssClass="alert alert-danger"  ></asp:RegularExpressionValidator>
    </fieldset>

    <fieldset>
        <label for="txtBodyPart" class="col-sm-2">Body Part:</label>
        <asp:TextBox ID="txtBodyPart" runat="server" required MaxLength="50" />
        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtBodyPart"
             ErrorMessage="No Numbers Allowed" ValidationExpression="^[a-zA-Z'.\s]{1,40}$" CssClass="alert alert-danger"  ></asp:RegularExpressionValidator>
    </fieldset>

    <fieldset>
        <label for="txtIntensity" class="col-sm-2">Intensity:</label>
        <asp:TextBox ID="txtIntensity" runat="server" required MaxLength="50" />
        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtIntensity"
             ErrorMessage="No Numbers Allowed" ValidationExpression="^[a-zA-Z'.\s]{1,40}$" CssClass="alert alert-danger"  ></asp:RegularExpressionValidator>
    </fieldset>

    <fieldset>
        <label for="txtReps" class="col-sm-2">Reps:</label>
        <asp:TextBox ID="txtReps" runat="server" required MaxLength="50"  />
        <asp:CompareValidator ID="repsValidator" runat="server" ControlToValidate="txtReps"
             Type="Integer" Operator="DataTypeCheck" ErrorMessage="Must Be A Number"
            CssClass="alert alert-danger" ></asp:CompareValidator>
    </fieldset>

    

    <!--Save the workout the user entered-->
    <div class="col-sm-offset-2">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success"
             OnClick="btnSave_Click" />
    </div>
</asp:Content>
