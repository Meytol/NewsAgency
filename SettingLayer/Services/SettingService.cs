using DataAccessLayer.Database;
using DataAccessLayer.Entities;
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
            var value = _context.Settings.Find(key).Value;

            var settingVM = new SettingVM()
            {
                Key = key,
                Value = value
            };

            return settingVM;

        }

        public void Set(string key ,string value)
        {
            var setting = new Setting
            {
                Key = key,
                Value = value
            };

            _context.Add(setting);
        }
    }
}