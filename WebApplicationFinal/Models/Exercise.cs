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
    
    public partial class Exercise
    {
        public Exercise()
        {
            this.Links = new HashSet<Link>();
        }
    
        public int ExerciseID { get; set; }
        public string Name { get; set; }
        public int Reps { get; set; }
        public int Setts { get; set; }
        public int ExerciseTypeID { get; set; }
    
        public virtual ExerciseType ExerciseType { get; set; }
        public virtual ICollection<Link> Links { get; set; }
    }
}
