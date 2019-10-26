using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class NewsService : GenericRepository<News>, INewsService
    {
        public NewsService(DatabaseContext context)
            : base(context)
        {

        }
    }
}