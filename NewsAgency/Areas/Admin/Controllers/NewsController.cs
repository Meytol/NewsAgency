using System.Net;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Entities;
using NewsAgency.Authentication.Controllers;

 namespace NewsAgency.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class NewsController : BaseController
    {
        private readonly INewsService _newsService;

        public NewsController(INewsService newsService)
        {
            _newsService = newsService;
        }

        public async Task<IActionResult> Index()
         {
            return View(await _newsService.GetAllIncludingByAdmin(news => news.Author).ToListAsync());
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var news = await _newsService
                .GetAllIncludingByAdmin(n => n.Author)
                .FirstOrDefaultAsync(n => n.Id == id);
               
            if (news == null)
            {
                return NotFound();
            }

            return View(news);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(News news)
        {
            if (!ModelState.IsValid)
                return View(news);

            var userId = 1;
            await _newsService.AddAsync(news, userId);
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var news = await _newsService.GetAsync(id.Value);

            if (news == null)
            {
                return NotFound();
            }
            
            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, News news)
        {
            if (id != news.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var userId = 1;
                    await _newsService.UpdateAsync(news, userId);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!_newsService.ExistsByAdmin(news.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            return View(news);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<HttpStatusCode> DeleteConfirmed(int id)
        {
             await _newsService.DeleteAsync(id);
            return HttpStatusCode.OK;
        }

    }
}