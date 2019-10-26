using BusinessLogicLayer.IServices;
using DataAccessLayer.Database;
using DataAccessLayer.Entities;
using DataAccessLayer.Repository;

namespace BusinessLogicLayer.Services
{
    public class ImageService : GenericRepository<Image>, IImageService
    {
        public ImageService(DatabaseContext context)
            : base(context)
        {

        }
    }
}