using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using Lcol.Models;
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
                Blob = BsonData.ToBson<getJson>(new getJson { id = id, sn = sn })
            };
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
                Blob = BsonData.ToBson<saveJson>(data)
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

    public abstract class someJson
    {
        public virtual string type { get; }
    }

    public class getJson : someJson
    {
        public override string type { get { return "saures.get"; } }
        public int id { get; set; }
        public string sn { get; set; }
    }

    public class postJson : someJson
    {
        public override string type { get { return "saures.post"; } }
        public saveJson json { get; set; }
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
        public string batf { get; set; }
        public string batp { get; set; }
        public List<Indication> data { get; set; }
    }

    public class Indication
    {
        public int id { get; set; }
        public string timestamp { get; set; }
        public string bat { get; set; }
        public string batf { get; set; }
        public string batp { get; set; }
        public string state { get; set; }
        public string fw_upd { get; set; }
        public string POR { get; set; }
        public List<Input> inputs { get; set; }
    }

    public class Input
    {
        public string n { get; set; }
        public string t { get; set; }
        public string val { get; set; }
        public string name { get; set; }
        public string state { get; set; }
    }
}
