using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//model references for EF
using WebApplicationFinal.Models;
using System.Web.ModelBinding;

namespace WebApplicationFinal.admin
{
    public partial class addWorkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if save wasn't clicked AND we have a WorkoutID in the url
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                GetWorkout();
            }
        }

        //get the current workout selected
        protected void GetWorkout()
        {
            try
            {
                //populate form with existing workout record
                Int32 WorkoutID = Convert.ToInt32(Request.QueryString["WorkoutID"]);

                //connect to db via EF
                using (DefaultConnectionEF db = new DefaultConnectionEF())
                {
                    //populate a workout instance with the WorkoutID from the URL parameter
                    Workout w = (from a in db.Workouts
                                 where a.WorkoutID == WorkoutID
                                 select a).FirstOrDefault();

                    //map the workout properties to the form controls if we found a match
                    if (w != null)
                    {
                        txtName.Text = w.Name;
                        txtBodyPart.Text = w.BodyPart;
                        txtIntensity.Text = w.Intensity;
                        txtReps.Text = w.Reps.ToString();
                        txtSetts.Text = w.Setts.ToString();
                        txtWorkoutDate.Text = w.WorkoutDate.ToString("yyyy-MM-dd");
                    }
                }
            }
            catch (System.IO.IOException)
            {
                Server.Transfer("/error.aspx", true);
            }
        }


        //Save the workout edit/ add
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                //use EF to connect to SQL Server
                using (DefaultConnectionEF db = new DefaultConnectionEF())
                {

                    //use the Workout model to save the new record
                    Workout w = new Workout();
                    Int32 WorkoutID = 0;

                    //check the querystring for an id so we can determine add / update
                    if (Request.QueryString["WorkoutID"] != null)
                    {
                        //get the id from the url
                        WorkoutID = Convert.ToInt32(Request.QueryString["WorkoutID"]);

                        //get the current workout from EF
                        w = (from a in db.Workouts
                             where a.WorkoutID == WorkoutID
                             select a).FirstOrDefault();
                    }

                    //Convert and add text to fields
                    w.Name = txtName.Text;
                    w.BodyPart = txtBodyPart.Text;
                    w.Reps = Convert.ToInt32(txtReps.Text);
                    w.Setts = Convert.ToInt32(txtSetts.Text);
                    w.Intensity = txtIntensity.Text;
                    w.WorkoutDate = Convert.ToDateTime(txtWorkoutDate.Text);

                    //call add only if we have no workout ID
                    if (WorkoutID == 0)
                    {
                        db.Workouts.Add(w);
                    }

                    //run the update or insert
                    db.SaveChanges();

                    //redirect to the updated students page
                    Response.Redirect("workouts.aspx");
                }
            }
            catch (System.IO.IOException)
            {
                Server.Transfer("/error.aspx", true);
            }
        }
    }
}