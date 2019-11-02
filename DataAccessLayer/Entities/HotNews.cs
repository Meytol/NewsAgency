using System;
using System.ComponentModel.DataAnnotations;

namespace DataAccessLayer.Entities
{
    public class HotNews
    {
        public int NewsId { get; set; }

        #region IAuditable Properties

        [Key]
        public int Id { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int ViewState { get; set; } = (int)Common.Enums.Models.ViewState.Available;

        #endregion

        #region Relations

        public News News { get; set; }

        #endregion


    }
}