using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class HotNewsTileViewComponent : ViewComponent
    {
        private readonly IHotNewsService _hotNewsService;

        public HotNewsTileViewComponent(IHotNewsService hotNewsService)
        {
            _hotNewsService = hotNewsService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _hotNewsService.GetLastHotNewsTileAsync());
        }
    }
}