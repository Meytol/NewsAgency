using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using Microsoft.AspNetCore.Mvc;

namespace NewsAgency.ViewComponents
{
    [ViewComponent]
    public class NewsCommentsViewComponent : ViewComponent
    {
        private readonly ICommentService _commentService;

        public NewsCommentsViewComponent(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<IViewComponentResult> InvokeAsync(int newsId, int userId = 0)
        {
            return View(
                model: await _commentService.GetNewsCommentAsync(newsId: newsId, userId: userId));

        }

    }
}
