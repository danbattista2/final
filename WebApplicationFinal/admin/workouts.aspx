<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="workouts.aspx.cs" Inherits="WebApplicationFinal.admin.workouts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Page that displays Workouts in the Database-->
    <h1 class="bg-primary text-center">Your Workouts</h1>

    <h3 class="bg-warning text-center"><a href="addWorkout.aspx">>Add Your Workout<</a></h3>

    <!--Drop down menu to change how many records are displayed-->
    <div class="text-center well">
        <label for="ddlPageSize">Records Per Page:</label>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" 
            OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
            <asp:ListItem Value="4" Text="4" />
            <asp:ListItem Value="6" Text="6" />
            <asp:ListItem Value="8" Text="8" />
        </asp:DropDownList>
    </div>

    <!--Grid with all the workouts-->
    <asp:GridView ID="grdWorkouts" OnRowDataBound="grdWorkouts_RowDataBound" runat="server" CssClass="table table-striped table-hover sort display well"
        AutoGenerateColumns="false" AllowPaging="true" OnRowDeleting="grdWorkouts_RowDeleting" DataKeyNames="WorkoutID" OnPageIndexChanging="grdWorkouts_PageIndexChanging" PageSize="4" AllowSorting="true"
        OnSorting="grdWorkouts_Sorting" >
        <Columns>
            <asp:BoundField DataField="WorkoutID" Visible="false" HeaderText="Workout ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="BodyPart" HeaderText="Body Part" SortExpression="BodyPart" />
            <asp:BoundField DataField="Intensity" HeaderText="Intensity" SortExpression="Intensity" />
            <asp:BoundField DataField="Reps" HeaderText="Reps" SortExpression="Reps" />
            <asp:BoundField DataField="Setts" HeaderText="Sets" SortExpression="Setts" />
            <asp:BoundField DataField="WorkoutDate" HeaderText="WorkoutDate" DataFormatString="{0:MM-dd-yyyy}" SortExpression="WorkoutDate" />
            <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="addWorkout.aspx"
                DataNavigateUrlFields="WorkoutID" 
                DataNavigateUrlFormatString="addWorkout.aspx?WorkoutID={0}" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

</asp:Content>
