using System;
using System.Collections.Generic;

namespace BusinessLogicLayer.ViewModels.News
{
    public class CategoryNewsMain
    {
        public int CategoryId { get; set; }
        public string CategoryTitle { get; set; }

        public IList<CategoryNewsViewModel> CategoryNewsViewModels { get; set; }
    }
}