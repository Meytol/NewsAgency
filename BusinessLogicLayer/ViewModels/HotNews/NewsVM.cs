using System;
using System.ComponentModel.DataAnnotations;
using Common.Enums.Models;

namespace BusinessLogicLayer.ViewModels.HotNews
{
    public class NewsVM
    {
        public int Id { get; set; }

        public string Headline { get; set; }
        public string Title { get; set; }
        public string Text { get; set; }
        public string ImageUrl { get; set; }
        public int AuthorId { get; set; }
        public int Status { get; set; } = (int)NewsStatus.WaitingForConfirmation;

        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public int ViewState { get; set; } = (int)Common.Enums.Models.ViewState.Available;

    }
}