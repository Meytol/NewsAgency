using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class SettingService : GenericRepository<Setting>, ISettingService
    {
        public SettingService(DatabaseContext context)
            : base(context)
        {

        }
    }
}