using SettingLayer.ViewModels;

namespace SettingLayer.IServices
{
    public interface ISettingService
    {
        SettingVM Get(string key);
        void Set(string key, string value);
    }
}