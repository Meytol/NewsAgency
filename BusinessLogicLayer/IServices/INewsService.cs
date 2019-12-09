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
        Task<NewsPaginationSection> GetLastNewsByCategoryIdAsync(int quentity, int categoryId, int page = 1);
        Task<OtherNewsSection> GetLastNewsAsync(int quentity);
        NewsViewModel GetNewsFull(int id);
        Task<NewsPaginationSection> GetLastNewsByAuthorIdAsync(int quentity, int authorId, int page = 1);
    }
}