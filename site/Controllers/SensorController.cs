using Microsoft.AspNetCore.Mvc;
using System;
using Lcol.Models;

namespace Lcol.Controllers
{
    /// <summary>
    /// Saures JSON standard
    /// </summary>
    public class Sensor : Controller
    {
        private readonly MySQLContext _context;

        public Sensor(MySQLContext context)
        {
            this._context = context;
        }

        [HttpGet]
        public JsonResult get(int id)
        {
            var sensorData = new RawData() { AddDateTime = DateTime.Now, Data = id.ToString() };
            _context.Add(sensorData);
            _context.SaveChanges();

            var r = new r1 { timestamp = (new DateTimeOffset(DateTime.Now)).ToUnixTimeSeconds().ToString() };
            return Json(r);
        }

        [HttpPost]
        public ContentResult save([FromBody] saveJson data)
        {
            var sensorData = new RawData()
            {
                AddDateTime = DateTime.Now,
                Data = $"{data.sn}|{data.local_ip}|{data.ssid}|{data.rssi}|{data.bat}"
            };
            _context.Add(sensorData);
            _context.SaveChanges();

            return Content("OK");
        }
    }

    public class r1
    {
        public string timestamp { get; set; }
    }

    public class saveJson
    {
        public string sn { get; set; }
        public string local_ip { get; set; }
        public string ssid { get; set; }
        public string rssi { get; set; }
        public string hardware { get; set; }
        public string firmware { get; set; }
        public string bat { get; set; }
    }   
}
