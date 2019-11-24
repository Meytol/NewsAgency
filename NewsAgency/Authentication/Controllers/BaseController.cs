using Microsoft.AspNetCore.Mvc;
using NewsAgency.Authentication.Attributes;

namespace NewsAgency.Authentication.Controllers
{
    [Grant]
    public class BaseController : Controller
    {
    }
}