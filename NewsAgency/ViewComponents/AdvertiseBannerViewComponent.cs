using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class AdvertiseBannerViewComponent : ViewComponent
    {
        private readonly IAdvertiseService _advertiseService;

        public AdvertiseBannerViewComponent(IAdvertiseService advertiseService)
        {
            _advertiseService = advertiseService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int advertiseId = 1)
        {
            return View(await _advertiseService.GetAsync(advertiseId));
        }
    }
}