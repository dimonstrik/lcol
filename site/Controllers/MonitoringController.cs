using Lcol.Models;
using Microsoft.AspNetCore.Mvc;

namespace Lcol.Controllers
{
    public class MonitoringController : Controller
    {
        private readonly MySQLContext _context;

        public MonitoringController(MySQLContext context)
        {
            this._context = context;
        }

        public IActionResult Index()
        {
            return View(this._context.RawDatas);
        }
    }
}
