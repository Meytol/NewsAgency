using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class OtherNewsViewComponent : ViewComponent
    {
        private readonly INewsService _newsService;

        public OtherNewsViewComponent(INewsService newsService)
        {
            _newsService = newsService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int quentity = 8)
        {
            return View(model: await _newsService.GetLastNewsAsync(quentity: quentity));
        }
    }
}
