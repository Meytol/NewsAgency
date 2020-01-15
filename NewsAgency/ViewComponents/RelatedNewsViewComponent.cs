using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class RelatedNewsViewComponent : ViewComponent
    {
        private readonly INewsService _newsService;

        public RelatedNewsViewComponent(INewsService newsService)
        {
            _newsService = newsService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int categoryId, int quentity = 3)
        {
            return View(
                model: await _newsService.GetLastNewsByCategoryIdAsync(quentity: quentity, categoryId: categoryId , page: 1));
        }
    }
}