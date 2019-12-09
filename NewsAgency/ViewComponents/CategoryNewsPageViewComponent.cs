using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class CategoryNewsPageViewComponent : ViewComponent
    {
        private readonly INewsService _newsService;

        public CategoryNewsPageViewComponent(INewsService newsService)
        {
            _newsService = newsService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int categoryId, int quentity = 6, int page = 1)
        {
            return View(model: await _newsService.GetLastNewsByCategoryIdAsync(quentity: quentity, categoryId: categoryId, page: page));
        }
    }
}