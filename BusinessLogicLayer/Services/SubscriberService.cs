using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class SubscriberService : GenericRepository<Subscriber>, ISubscriberService
    {
        public SubscriberService(DatabaseContext context)
            : base(context)
        {

        }
    }
}