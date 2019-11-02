using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class HeaderViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View();
        }
    }
}