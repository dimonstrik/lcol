using System;
using System.Linq;
using System.Threading;
using Lcol.Models;

namespace Lcol
{
    public class Program
    {
        public static void Main(string[] args)
        {
            using (var db = new MySQLContext())
            {

                var raws = db.RawDatas.Take(10).ToList();

                foreach(var raw in raws)
                {
                    Console.WriteLine($"{raw.Id}|{raw.AddDateTime}|{raw.GetBlobMd5()}");

                }
            }
        }
    }
}