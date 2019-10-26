using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class UserRoleService : GenericRepository<UserRole>, IUserRoleService
    {
        public UserRoleService(DatabaseContext context)
        :base(context)
        {
            
        }
    }
}