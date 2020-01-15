using System.Threading.Tasks;
using BusinessLogicLayer.IServices;
using BusinessLogicLayer.ViewModels.News;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class NewsSeenService : GenericRepository<NewsSeen>, INewsSeenService
    {
        public NewsSeenService(DatabaseContext context)
            : base(context)
        {

        }

        public void SeenNews(int newsId, int userId)
        {
            var newsSeenModel = new NewsSeen()
            {
                UserId = userId,
                NewsId = newsId
            };

            Add(newsSeenModel, userId);
        }

        public async Task SeenNewsAsync(int newsId, int userId)
        {
            var newsSeenModel = new NewsSeen()
            {
                UserId = userId,
                NewsId = newsId
            };

            await AddAsync(newsSeenModel, userId);
        }
    }
}