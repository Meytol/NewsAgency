using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class UserService : GenericRepository<User>, IUserService
    {
        public UserService(DatabaseContext context)
            : base(context)
        {

        }

    }
}