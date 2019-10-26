using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class CategoryService : GenericRepository<Category>, ICategoryService
    {
        public CategoryService(DatabaseContext context)
            : base(context)
        {

        }
    }
}