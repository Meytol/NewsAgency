using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using NewsAgency.Authentication.Controllers;

namespace NewsAgency.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class CategoriesController : BaseController
    {
        private readonly ICategoryService _categoryService;

        public CategoriesController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        // GET: Admin/Categories
        public async Task<IActionResult> Index()
        {
            return View(await _categoryService.GetAllAsyncByAdmin());
        }

        // GET: Admin/Categories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _categoryService.GetAsyncByAdmin(id.Value);

            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        public IActionResult Create(int parentId = 0)
        {
            var category = new Category();

            if (parentId != 0 && _categoryService.Exists(parentId))
            {
                category.ParentId = parentId;
            }
            
            return View(category);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Category category)
        {
            if (ModelState.IsValid)
            {
                var userId = 1;
                await _categoryService.AddAsync(category, userId);
                return RedirectToAction(nameof(Index),"Categories");
            }
            return View(category);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var category = await _categoryService.GetAsyncByAdmin(id.Value);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Category category)
        {
            if (id != category.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var userId = 1;
                    await _categoryService.UpdateAsync(category, userId);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!_categoryService.ExistsByAdmin(category.Id))
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
            return View(category);
        }

        [HttpPost]
        public async Task<bool> Delete(int id)
        {
            if (!ModelState.IsValid)
                throw new Exception("400:Badrequest");

            if (!_categoryService.ExistsByAdmin(id))
                throw new Exception("404:NotFound Data");

            if (_categoryService.FindByAdmin(c => c.ParentId == id).Any())
                return false;

            await _categoryService.DeleteAsync(id);
            return true;
        }
    }
}
