using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using BusinessLogicLayer.ViewModels.Comment;
using Common.Enums.Models;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;
using Microsoft.EntityFrameworkCore;

namespace BusinessLogicLayer.Services
{
    public class CommentService : GenericRepository<Comment>, ICommentService
    {
        public CommentService(DatabaseContext context)
            :base(context)
        {
            
        }

        public async Task<NewsCommentSection> GetNewsCommentAsync(int newsId, int userId)
        {
            var comments = await FindBy(c => c.NewsId == newsId)
                .Where(c => c.State == (int) CommentState.Approved || c.AuthorId == userId)
                .Include(c => c.User)
                .OrderByDescending(c => c.CreatedOn)
                .ToListAsync();

            var newsCommentSection = new NewsCommentSection()
            {
                Comments = comments
            };

            return newsCommentSection;
        }
    }
}