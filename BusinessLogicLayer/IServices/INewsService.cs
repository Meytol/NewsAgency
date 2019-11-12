using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using BusinessLogicLayer.ViewModels.News;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface INewsService  : IGenericRepository<News>
    {
        Task<CategoryNewSection> GetLastNewsByCategoryIdAsync(int quentity, int categoryId);
        Task<CategoryNewSection> GetLastNewsAsync(int quentity);
    }
}