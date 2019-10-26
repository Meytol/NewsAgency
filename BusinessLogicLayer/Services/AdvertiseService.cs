using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class AdvertiseService : GenericRepository<Advertise>, IAdvertiseService
    {
        public AdvertiseService(DatabaseContext context)
            : base(context)
        {

        }
    }
}