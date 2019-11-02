using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class UserRole : IAuditable
    {
        public int UserId { get; set; }
        public int RoleId { get; set; }

        #region IAuditable Properties

        [Key]
        public int Id { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int ViewState { get; set; } = (int) Common.Enums.Models.ViewState.Available;
        
        #endregion

        #region Relations

        public User User { get; set; }
        public Role Role { get; set; }

        #endregion

    }
}
