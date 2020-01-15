using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class HeaderViewComponent : ViewComponent
    {
        private readonly ICategoryService _categoryService;

        public HeaderViewComponent(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View(await _categoryService.GetAllAsync());
        }
    }
}