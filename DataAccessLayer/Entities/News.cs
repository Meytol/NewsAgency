using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Common.Enums.Models;
using Common.Interfaces.Models;

namespace DataAccessLayer.Entities
{
    public class News : IAuditable
    {
        public string Headline { get; set; }
        public string Title { get; set; }
        [DataType(DataType.Html)]
        public string Text { get; set; }
        public string ImageUrl { get; set; }
        public int AuthorId { get; set; }
        public int Status { get; set; } = (int) NewsStatus.WaitingForConfirmation;

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

        public User Author { get; set; }
        public ICollection<NewsCategory> NewsCategories { get; set; }

        #endregion

    }
}