using DataAccessLayer.Database;
using SettingLayer.IServices;
using SettingLayer.ViewModels;

namespace SettingLayer.Services
{
    public class SettingService : ISettingService
    {
        private  DatabaseContext _context;

        public SettingService(DatabaseContext context)
        {
            _context = context;
        }

        public SettingVM Get(string key)
        {
            _context.
        }

        public void Set(string key)
        {
            throw new System.NotImplementedException();
        }
    }
}