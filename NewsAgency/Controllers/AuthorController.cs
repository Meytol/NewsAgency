using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using BusinessLogicLayer.ViewModels.Author;
using Microsoft.AspNetCore.Mvc;
using NewsAgency.Authentication.Controllers;

namespace NewsAgency.Controllers
{
    public class AuthorController : BaseController
    {
        private readonly IUserService _userService;

        public AuthorController(IUserService userService)
        {
            _userService = userService;
        }
        
        public IActionResult Index(int id)
        {
            var model = _userService.GetAuthorPageViewModel(authorId: id);

            ViewBag.AuthorId = id;
            return View(model);
        }

        public IActionResult GetNewsByAuthorId(int authorId, int quentity = 8, int page = 1)
        {
            return ViewComponent("AuthorNewsPage", new
            {
                authorId,
                quentity,
                page
            });
        }
    }
}