using System;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface INewsService  : IGenericRepository<News>
    {
      
    }
}