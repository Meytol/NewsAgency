using System.Threading.Tasks;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface INewsSeenService : IGenericRepository<NewsSeen>
    {
        Task SeenNewsAsync(int newsId, int userId);
        void SeenNews(int newsId, int userId);
    }
}