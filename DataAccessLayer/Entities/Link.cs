using System;
using System.ComponentModel.DataAnnotations;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class Link : IAuditable
    {
        public int? ActionId { get; set; }
        public int? ParentId { get; set; }
        public string Title { get; set; }
        public string Icon { get; set; }

        #region IAuditable Properties

        [Key]
        public int Id { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int ViewState { get; set; }

        #endregion

    }
}