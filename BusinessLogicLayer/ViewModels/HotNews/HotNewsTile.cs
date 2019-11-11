using System;

namespace BusinessLogicLayer.ViewModels.HotNews
{
    public class HotNewsTile
    {
        public int Id { get; set; }
        public int NewsId { get; set; }
        public DateTime CreatedOn { get; set; }
        public string NewsHeadline { get; set; }
        public string NewsTitle { get; set; }
        public string ImageUrl { get; set; }
        public string CategoryTitle { get; set; }
        public int CategoryId { get; set; }
    }
}