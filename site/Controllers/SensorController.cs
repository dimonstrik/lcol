using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using Lcol.Models;
using Lcol.Data;
using System.Text;
using Newtonsoft.Json.Bson;
using System.IO;
using Newtonsoft.Json;

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
            string sn = Request.Headers["SERIAL-NUMBER"];
            var sensorData = new RawData()
            {
                AddDateTime = DateTime.Now,
                Blob = Bson.ToBson<GetSaures>(new GetSaures { id = id, sn = sn })
            };
            _context.Add(sensorData);
            _context.SaveChanges();

            var r = new r1 { timestamp = (new DateTimeOffset(DateTime.Now)).ToUnixTimeSeconds().ToString() };
            return Json(r);
        }

        [HttpPost]
        public ContentResult save([FromBody] Save data)
        {
            
            var sensorData = new RawData()
            {
                AddDateTime = DateTime.Now,
                Blob = Bson.ToBson<Save>(data)
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
}
