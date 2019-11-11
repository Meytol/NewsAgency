using System.Collections.Generic;
using System.Threading.Tasks;
using BusinessLogicLayer.ViewModels.HotNews;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface IHotNewsService : IGenericRepository<HotNews>
    {
        IEnumerable<HotNews> GetLastHotNewses(int quentity = 6);
        Task<IEnumerable<HotNews>> GetLastHotNewsesAsync(int quentity = 6);
        Task<IEnumerable<HotNewsHeader>> GetLastHotNewsHeaderAsync(int quentity = 6);
        Task<IEnumerable<HotNewsTile>> GetLastHotNewsTileAsync(int quentity = 4);
    }
}