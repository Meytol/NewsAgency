using System;
using System.Collections.Generic;
using DataAccessLayer.Entities;

namespace BusinessLogicLayer.ViewModels.News
{
    public class NewsPaginationSection
    {
        public int MainCategoryId { get; set; }
        public string MainCategoryTitle { get; set; }
        public string CategoryImageUrl { get; set; }
        public int CurrentPageNumber { get; set; }
        public int NumberOfPages { get; set; }

        public IList<NewsViewModel> NewsViewModels { get; set; }
    }
}