//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplicationFinal.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ExerciseType
    {
        public ExerciseType()
        {
            this.Exercises = new HashSet<Exercise>();
        }
    
        public int ExerciseTypeID { get; set; }
        public string Bodypart { get; set; }
    
        public virtual ICollection<Exercise> Exercises { get; set; }
    }
}
