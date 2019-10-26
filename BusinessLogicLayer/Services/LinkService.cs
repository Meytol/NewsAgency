using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class LinkService : GenericRepository<Link>, ILinkService
    {
        public LinkService(DatabaseContext context)
            : base(context)
        {

        }
    }
}