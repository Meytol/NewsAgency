using System.Text;

namespace FPG.Common.IServices
{
    public interface IEncryptionService
    {
        string Decrypt(string data, string key);
        string Encrypt(string data, string key);
        string GetKey(string n, string e);
        string GetKey(string n, Encoding e);
    }
}