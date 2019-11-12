using System;
using System.Collections.Generic;

namespace BusinessLogicLayer.ViewModels.News
{
    public class CategoryNewSection
    {
        public int CategoryId { get; set; }
        public string CategoryTitle { get; set; }
        public string CategoryImageUrl { get; set; }

        public IList<NewsViewModel> NewsViewModels { get; set; }
    }
}