using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class AuthorNewsPageViewComponent : ViewComponent
    {
        private readonly INewsService _newsService;

        public AuthorNewsPageViewComponent(INewsService newsService)
        {
            _newsService = newsService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int authorId, int quentity = 8, int page = 1)
        {
            return View(model: await _newsService.GetLastNewsByAuthorIdAsync(quentity: quentity, authorId: authorId, page: page));
        }

    }
}