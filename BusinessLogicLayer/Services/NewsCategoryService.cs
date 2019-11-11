using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;
using Microsoft.EntityFrameworkCore;

namespace BusinessLogicLayer.Services
{
    public class NewsCategoryService : GenericRepository<NewsCategory>, INewsCategoryService
    {
        public NewsCategoryService(DatabaseContext context)
            :base(context)
        {
            
        }
    }
}