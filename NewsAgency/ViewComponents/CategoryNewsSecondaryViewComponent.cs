using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class CategoryNewsSecondaryViewComponent : ViewComponent
    {
        private readonly INewsService _newsService;

        public CategoryNewsSecondaryViewComponent(INewsService newsService)
        {
            _newsService = newsService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int categoryId, int quentity = 4)
        {
            return View(model: await _newsService.GetLastNewsByCategoryIdAsync(quentity: 4, categoryId: categoryId));
        }

    }
}
