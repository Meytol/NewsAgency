using System;
using BusinessLogicLayer.ViewModels.Author;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.IServices
{
    public interface IUserService : IGenericRepository<User>
    {
        AuthorPageViewModel GetAuthorPageViewModel(int authorId);
    }
}