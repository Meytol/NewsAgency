using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class Role : IAuditable
    {
        public string Title { get; set; }

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

        public ICollection<RoleAction> RoleActions { get; set; }
        public ICollection<UserRole> UserRoles { get; set; }

        #endregion
    }
}