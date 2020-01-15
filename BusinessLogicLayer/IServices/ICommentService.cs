using System.Threading.Tasks;
using BusinessLogicLayer.ViewModels.Comment;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface ICommentService : IGenericRepository<Comment>
    {
        Task<NewsCommentSection> GetNewsCommentAsync(int newsId, int userId);

    }
}