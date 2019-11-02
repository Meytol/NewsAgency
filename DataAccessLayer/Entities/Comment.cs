using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Common.Enums.Models;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class Comment : IAuditable
    {
        public int AuthorId { get; set; }
        public int? ParentId { get; set; }
        public int State { get; set; } = (int) CommentState.NotApproved;

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

        #endregion
    }
}