using System;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class Role : IAuditable
    {
        public int Id { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int ViewState { get; set; }
    }
}