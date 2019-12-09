using System.Collections.Generic;
using DataAccessLayer.Entities;

namespace BusinessLogicLayer.ViewModels.News
{
    public class CategoryNewsPageViewModel
    {
        public int CategoryId { get; set; }
        public string CategoryTitle { get; set; }

        public IList<Category> ChildCategories { get; set; }
    }
}