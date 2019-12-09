using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using BusinessLogicLayer.ViewModels.News;
using DataAccessLayer.Entities;
using Microsoft.AspNetCore.Mvc;
using NewsAgency.Authentication.Controllers;

namespace NewsAgency.Controllers
{
    public class CategoryController : BaseController
    {
        private readonly INewsService _newsService;
        private readonly ICategoryService _categoryService;

        public CategoryController(INewsService newsService, ICategoryService categoryService)
        {
            _newsService = newsService;
            _categoryService = categoryService;
        }

        public IActionResult Index(int id)
        {


            var model = new CategoryNewsPageViewModel
            {
                CategoryId = id,
                CategoryTitle = _categoryService.Get(id).Title,
                ChildCategories = new List<Category>()
            };

            var categoriesIds = _categoryService.FindCategoryChildsByParentId(id);
            foreach (var categoriesId in categoriesIds.Where(catId => catId != id))
            {
                model.ChildCategories.Add(_categoryService.Get(categoriesId));
            }

            ViewBag.CategoryId = id;
            return View(model);
        }

        public IActionResult GetNews(int categoryId, int quentity = 5, int page = 0)
        {
            return ViewComponent("CategoryNewsPage", new
            {
                categoryId,
                quentity,
                page
            });

        }
    }
}