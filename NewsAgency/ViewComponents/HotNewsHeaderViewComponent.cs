using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class HotNewsHeaderViewComponent : ViewComponent
    {
        private readonly IHotNewsService _hotNewsService;

        public HotNewsHeaderViewComponent(IHotNewsService hotNewsService)
        {
            _hotNewsService = hotNewsService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(model: await _hotNewsService.GetLastHotNewsHeaderAsync());
        }
    }
}