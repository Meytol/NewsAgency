using System.Collections.Generic;
using System.Linq;
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

        public List<int> FindCategoryChildsByParentId(int parentId)
        {
            var categoriesIds = new List<int>
            {
                parentId
            };

            foreach (var categoriesId in categoriesIds)
            {
                categoriesIds.AddRange(FindBy(category => category.ParentId == categoriesId).Select(category => category.Id).ToList());
            }

            return categoriesIds;
        }
    }
}