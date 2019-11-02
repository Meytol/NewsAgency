using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Common.Enums.Models;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class Action : IAuditable
    {
        public int? ParentId { get; set; }
        public string Title { get; set; }
        public int Type { get; set; }

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

        #endregion
    }
}