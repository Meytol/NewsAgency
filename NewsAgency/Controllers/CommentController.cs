using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using DataAccessLayer.Entities;
using Microsoft.AspNetCore.Mvc;
using NewsAgency.Authentication.Controllers;

namespace NewsAgency.Controllers
{
    public class CommentController : BaseController
    {
        private readonly ICommentService _commentService;

        public CommentController(ICommentService commentService)
        {
            _commentService = commentService;
        }


        [HttpPost]
        public IActionResult Create(int newsId, string commentText, int parentId = 0)
        {
            if (!ModelState.IsValid)
                return RedirectToAction("Index", "News", new { @id = newsId });

            var userId = 1;

            var comment = new Comment()
            {
                AuthorId = userId,
                NewsId = newsId,
                Text = commentText,
            };

            if (parentId == 0)
                comment.ParentId = null;
            else
                comment.ParentId = parentId;

            _commentService.Add(comment, userId);

            return RedirectToAction("Index","News",new {@id = newsId});
        }
    }
}