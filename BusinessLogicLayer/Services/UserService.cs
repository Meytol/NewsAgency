using System.Linq;
using BusinessLogicLayer.IServices;
using BusinessLogicLayer.ViewModels.Author;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class UserService : GenericRepository<User>, IUserService
    {
        private readonly INewsService _newsService;
        public UserService(DatabaseContext context, INewsService newsService)
            : base(context)
        {
            _newsService = newsService;
        }

        public AuthorPageViewModel GetAuthorPageViewModel(int authorId)
        {
            var model = new AuthorPageViewModel
            {
                Author = Get(authorId),
                NewsCount = _newsService.FindBy(news => news.AuthorId == authorId).Count(),
                CommentCount = 0
            };


            return model;
        }
    }
}