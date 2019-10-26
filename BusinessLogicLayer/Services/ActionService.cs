using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class ActionService : GenericRepository<Action>, IActionService
    {
        public ActionService(DatabaseContext context)
            : base(context)
        {

        }
    }
}