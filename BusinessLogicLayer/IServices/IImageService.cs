using System;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface IImageService  : IGenericRepository<Image>
    {
       
    }
}