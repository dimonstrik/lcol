using System;
using System.Linq;
using System.Threading;
using Lcol.Data;
using Lcol.Models;

namespace Lcol
{
    public class Program
    {
        public static void Main(string[] args)
        {
            using (var db = new MySQLContext())
            {
                var raws = db.RawDatas.Take(2).ToList();

                foreach(var raw in raws)
                {
                    var baseJson = Bson.FromBson<GetSaures>(raw.Blob);
                    var baseJsonType = baseJson.Type;
                    switch(baseJsonType)
                    { 
                        case "saures.get":
                            var device = (GetSaures)baseJson;
                            if (db.Devices.Where(d => d.SerialNumber == device.sn).Count()==0)
                            {
                                db.Devices.Add(new Device() {
                                    Type = DeviceType.Saures,
                                    SerialNumber = device.sn,
                                    Details = $"last_online:{raw.AddDateTime}" 
                                });
                                db.SaveChanges();
                            }
                            else
                            {
                                var selectedDevice = db.Devices.SingleOrDefault(d => d.SerialNumber == device.sn);
                                selectedDevice.Details = $"last_online:{raw.AddDateTime}";
                                db.SaveChanges();
                            }
                            break;
                        case "saures.post":
                            break;
                    }
                   
                    Console.WriteLine($"{raw.Id}|{raw.AddDateTime}|{raw.GetBlobMd5()}");

                }
            }
        }
    }
}