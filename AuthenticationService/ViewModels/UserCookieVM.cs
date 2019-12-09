using System;

namespace AuthenticationService.ViewModels
{
    public class UserCookieVM
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool RememberMe { get; set; }
        public DateTime? ExpireDateTime { get; set; }
        
    }
}
