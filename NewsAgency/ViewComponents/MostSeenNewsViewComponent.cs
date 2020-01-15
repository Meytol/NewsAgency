using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class MostSeenNewsViewComponent : ViewComponent
    {
        private readonly INewsService _newsService;

        public MostSeenNewsViewComponent(INewsService newsService)
        {
            _newsService = newsService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int quentity = 4)
        {
            return View(
                model: await _newsService.GetMostSeenNewses(quentity));
            
        }
    }
}
