using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class NewsCategory : IAuditable
    {
        public int CategoryId { get; set; }
        public int NewsId { get; set; }
        public bool IsMain { get; set; }

        #region IAuditable Properties

        [Key]
        public int Id { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int ViewState { get; set; }

        #endregion

        #region Relations

        public News News { get; set; }
        public Category Category { get; set; }

        #endregion
    }
}