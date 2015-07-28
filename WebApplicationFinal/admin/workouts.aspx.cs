using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//reference the EF models
using WebApplicationFinal.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

namespace WebApplicationFinal.admin
{
    public partial class workouts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate workout grid
            if (!IsPostBack)
            {
                Session["SortDirection"] = "ASC";
                Session["SortColumn"] = "WorkoutID";
                GetWorkouts();
            }
        }

        //Connect to the database and get the workouts
        protected void GetWorkouts()
        {
            try
            {
                Int32 ExerciseID = Convert.ToInt32(Request.QueryString["CourseID"]);
                //connect to EF
                using (DefaultConnectionEF db = new DefaultConnectionEF())
                {

                    //query the workouts table using EF and LINQ
                    var workouts = (from w in db.Workouts
                                    select new { w.WorkoutID, w.Name, w.BodyPart, w.Intensity, w.Reps, w.Setts, w.WorkoutDate });
                    //var Workouts = from w in db.Workouts
                    //             select w;

                    String Sort = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();


                    //var objE = (from w in db.Links
                    // join d in db.Workouts on w.WorkoutID equals d.WorkoutID
                    //join a in db.Exercises on w.ExerciseID equals a.ExerciseID
                    //where w.ExerciseID == ExerciseID
                    //select new { d.WorkoutID, d.Intensity, a.Reps, a.Setts, d.WorkoutDate });


                    //bind the result to the gridview
                    //grdWorkouts.DataSource = Workouts.ToList();
                    grdWorkouts.DataSource = workouts.AsQueryable().OrderBy(Sort).ToList();
                    grdWorkouts.DataBind();
                    //grdTestWorkouts.DataSource = objE.ToList();
                    //grdTestWorkouts.DataBind();

                }
            }catch (System.IO.IOException)
            {
                Server.Transfer("/error.aspx", true);
            }
        }

        //Add sorting on the column headings
        protected void grdWorkouts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();
                    //loop though each column
                    for (int i = 0; i <= grdWorkouts.Columns.Count - 1; i++)
                    {
                        if (grdWorkouts.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "DESC")
                            {
                                SortImage.ImageUrl = "/images/desc.jpg";
                                SortImage.AlternateText = "Sort Desending";
                            }
                            else
                            {
                                SortImage.ImageUrl = "/images/asc.jpg";
                                SortImage.AlternateText = "Sort Assending";
                            }

                            e.Row.Cells[i].Controls.Add(SortImage);

                        }
                    }
                }
            }
        }

        //Delete a row that the user selects
        protected void grdWorkouts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //store which row was clicked
                Int32 selectedRow = e.RowIndex;

                //get the selected WorkoutID using the grid's Data Key collection
                Int32 WorkoutID = Convert.ToInt32(grdWorkouts.DataKeys[selectedRow].Values["WorkoutID"]);
                //use EF to remove the selected workouts from the db
                using (DefaultConnectionEF db = new DefaultConnectionEF())
                {


                    Workout a = (from aw in db.Workouts
                                 where aw.WorkoutID == WorkoutID
                                 select aw).FirstOrDefault();

                    //do the delete
                    db.Workouts.Remove(a);
                    db.SaveChanges();


                }
                //refresh the grid
                GetWorkouts();
            }
            catch (System.IO.IOException)
            {
                Server.Transfer("/error.aspx", true);
            }
        }

        protected void grdWorkouts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //set the page index and refresh the grid
            grdWorkouts.PageIndex = e.NewPageIndex;
            GetWorkouts();
        }

        protected void grdWorkouts_Sorting(object sender, GridViewSortEventArgs e)
        {
            //set the global sort column to column clicked on by the user
            Session["SortColumn"] = e.SortExpression;
            GetWorkouts();

            //toggle the direction
            if (Session["SortDirection"].ToString() == "ASC")
            {
                Session["SortDirection"] = "DESC";
            }
            else
            {
                Session["SortDirection"] = "ASC";
            }
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //set the page size and refresh the grid
            grdWorkouts.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            GetWorkouts();
        }
    }
}