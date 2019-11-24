using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class CategoryNewsMainViewComponent : ViewComponent
    {
        private readonly INewsService _newsService;

        public CategoryNewsMainViewComponent(INewsService newsService)
        {
            _newsService = newsService;
        }

        //[ResponseCache(Duration = 600, Location = ResponseCacheLocation.Any, NoStore = false)]
        public async Task<IViewComponentResult> InvokeAsync(int categoryId, int quentity = 5)
        {
            return View(model: await _newsService.GetLastNewsByCategoryIdAsync(quentity: quentity, categoryId: categoryId));
        }
    }
}
