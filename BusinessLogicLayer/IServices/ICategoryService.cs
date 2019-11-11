using System;
using System.Collections.Generic;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface ICategoryService  : IGenericRepository<Category>
    {
        List<int> FindCategoryChildsByParentId(int parentId);

    }
}