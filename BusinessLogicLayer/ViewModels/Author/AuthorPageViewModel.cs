using System.Collections.Generic;
using BusinessLogicLayer.ViewModels.News;
using DataAccessLayer.Entities;

namespace BusinessLogicLayer.ViewModels.Author
{
    public class AuthorPageViewModel
    {
        public User Author { get; set; }
        public int NewsCount { get; set; }
        public int CommentCount { get; set; }
    }
}