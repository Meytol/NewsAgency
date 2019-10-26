using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class RoleActionService : GenericRepository<RoleAction>, IRoleActionService
    {
        public RoleActionService(DatabaseContext context)
            : base(context)
        {

        }
    }
}