using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class RoleService : GenericRepository<Role>, IRoleService
    {
        public RoleService(DatabaseContext context)
            : base(context)
        {

        }
    }
}