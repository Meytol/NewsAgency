using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;
using NewsAgency.Authentication.Controllers;

namespace NewsAgency.Controllers
{
    public class NewsController : BaseController
    {
        private readonly INewsService _newsService;

        public NewsController(INewsService newsService)
        {
            _newsService = newsService;
        }

        public IActionResult Index(int id)
        {
            if (id == 0)
                return RedirectToAction(nameof(Index),"Home");

            if (!_newsService.Exists(id))
                RedirectToAction("NotFound", "Error");

            var model = _newsService.GetNewsFull(id);

            ViewData["Title"] = model.NewsTitle;
            ViewBag.CategoryId = model.CategoryId;

            return View(model);
        }

        public IActionResult GetRelatedNews(int categoryId, int quentity = 3)
        {
            return ViewComponent("RelatedNews", new
            {
                categoryId,
                quentity
            });
        }
    }
}