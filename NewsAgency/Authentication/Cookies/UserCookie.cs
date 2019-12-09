using System;
using System.Configuration;
using AuthenticationService.ViewModels;
using FPG.Common.IServices;
using Microsoft.AspNetCore.Http;

namespace NewsAgency.Authentication.Cookies
{
    public class UserCookie
    {
        private readonly IEncryptionService _encryptionService;
        private readonly string _cookieName = ConfigurationManager.AppSettings["CookieName"];

        public UserCookie(IEncryptionService encryptionService)
        {
            _encryptionService = encryptionService;
        }

        public HttpCookie GetUserCookie(HttpContext currentHttpContext, out string value)
        {
             var container = UnityConfig.GetConfiguredContainer();
            var encryptionService = container.Resolve<IEncryptionService>();
            var decryptKey = ConfigurationManager.AppSettings["DecryptKey"];
            value = string.Empty;

             currentHttpContext.Request.Cookies.TryGetValue(_cookieName, out string cookie);

            try
            {
                if (cookie == null)
                    return null;

                var decryptedValue = encryptionService.Decrypt(cookie.Value, decryptKey);
                value = decryptedValue;

                return cookie;
            }
            catch (Exception e)
            {
                return null;
            }
            finally
            {
                //currentHttpContext = null;
            }
        }

        public UserCookieVM GetUserCookieModel(HttpContext currentHttpContext)
        {
            var cookie = GetUserCookie(currentHttpContext, out string value);
            try
            {
                if (cookie == null)
                    return null;

                // cookie.Value = "UserName:{0},Password:{1},UserId:{2},RememberMe:{3}";
                var values = value.Split('/');

                var model = new UserCookieVM
                {
                    UserName = values[0].Replace("UserName", ""),
                    Password = values[1].Replace("Password", ""),
                    UserId = values[2].Replace("UserId", ""),
                    RememberMe = bool.Parse(values[3].Replace("RememberMe", "")),
                    ExpireDateTime = cookie.Expires
                };

                return model;
            }
            finally
            {
                //currentHttpContext = null;

                //if (cookie != null)
                //    cookie.Value = null;

                //cookie = null;
            }
        }

        public void CreateUserCookie(HttpContext httpContext, UserCookieVM cookieModel)
        {
            var encryptKey = ConfigurationManager.AppSettings["DecryptKey"];

            var cookie = new HttpCookie(_cookieName);
            var value =
                $"UserName{cookieModel.UserName}/Password{cookieModel.Password}/UserId{cookieModel.UserId}/RememberMe{cookieModel.RememberMe.ToString()}";

            cookie.Value = _encryptionService.Encrypt(value, encryptKey);

            cookie.Expires = cookieModel.ExpireDateTime ?? GetCookieExpireDate(cookieModel.RememberMe);

            httpContext.Response.Cookies.Add(cookie);
        }

        public void UpdateCookieExpireDate(HttpContext currentHttpContext)
        {
            var decryptKey = ConfigurationManager.AppSettings["DecryptKey"];

            var cookie = GetUserCookie(currentHttpContext, out string val);

            var cookieRememberMe = GetUserCookieModel(currentHttpContext).RememberMe;
            cookie.Expires = GetCookieExpireDate(cookieRememberMe);

            currentHttpContext.Response.Cookies.Set(cookie);
        }

        public DateTime GetCookieExpireDate(bool rememberMe)
        {
            return rememberMe ? DateTime.UtcNow.AddMonths(1) : DateTime.UtcNow.AddHours(1);
        }

        public void DisposeCookie(HttpContext currentHttpContext)
        {
            var cookie = GetUserCookie(currentHttpContext, out string value);

            cookie.Value = string.Empty;
            cookie.Expires = DateTime.Now.AddDays(-1);

            currentHttpContext.Response.Cookies.Set(cookie);
        }

    }
}