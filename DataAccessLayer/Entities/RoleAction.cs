using System;
using System.ComponentModel.DataAnnotations;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class RoleAction : IAuditable
    {
        public int RoleId { get; set; }
        public int ActionId { get; set; }

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

        public Role Role { get; set; }
        public Action Action { get; set; }

        #endregion
    }
}