using System;
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
            var allCategories = GetAll();

            var categoriesIds = new List<int>
            {
                parentId
            };

            categoriesIds.AddRange(allCategories.Where(category => category.ParentId == parentId)
                .Select(category => category.Id).ToList());

            return categoriesIds;
        }
    }
}