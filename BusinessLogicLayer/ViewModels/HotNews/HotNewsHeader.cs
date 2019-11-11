using System;
using DataAccessLayer.Entities;

namespace BusinessLogicLayer.ViewModels.HotNews
{
    public class HotNewsHeader
    {
        public int Id { get; set; }
        public int NewsId { get; set; }
        public DateTime CreatedOn { get; set; }
        public string NewsHeadline { get; set; }
        public string NewsTitle { get; set; }
        public string Href { get; set; }

    }
}