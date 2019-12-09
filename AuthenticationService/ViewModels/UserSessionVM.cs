namespace AuthenticationService.ViewModels
{
    public class UserSessionVM
    {
        public string FullName { get; set; }

        public string UserId { get; set; }
        public string Roles { get; set; }
        public bool IsLocked { get; set; }
    }
}
