using Microsoft.AspNetCore.Mvc;
using System;

namespace site.Controllers
{
    public class r1
    {
        public string timestamp { get; set; }
    }

    public class sensor : Controller
    {
        [HttpGet]
        public JsonResult get(int id)
        {
            var r = new r1 { timestamp = (new DateTimeOffset(DateTime.Now)).ToUnixTimeSeconds().ToString() };
            return Json(r);
        }

        [HttpPost]
        public ContentResult save()
        {
            return Content("OK");
        }
    }

}
