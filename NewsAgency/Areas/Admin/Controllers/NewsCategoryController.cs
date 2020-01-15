using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using DataAccessLayer.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NewsAgency.Authentication.Controllers;

namespace NewsAgency.Areas.Admin.Controllers
{
    public class NewsCategoryController : BaseController
    {
        private readonly INewsCategoryService _newsCategoryService;

        public NewsCategoryController(INewsCategoryService newsCategoryService)
        {
            _newsCategoryService = newsCategoryService;
        }

        // GET: NewsCategory
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NewsCategory newsCategory)
        {
            if (!ModelState.IsValid)
                return View();

            try
            {
                var userId = 1;

                _newsCategoryService.Add(newsCategory, userId);

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public async Task<bool> Delete(int id)
        {
            if (!ModelState.IsValid)
                throw new Exception("400:Badrequest");

            if (!_newsCategoryService.ExistsByAdmin(id))
                throw new Exception("404:NotFound Data");

            await _newsCategoryService.DeleteAsync(id);
            return true;
        }
    }
}