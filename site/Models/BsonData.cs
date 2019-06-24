using System;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Bson;

namespace Lcol.Models
{
    public abstract class BsonData
    {
        public static byte[] ToBson<T>(T value)
        {
            using (var ms = new MemoryStream())
            {
                using (var datawriter = new BsonDataWriter(ms))
                {
                    var serializer = new JsonSerializer();
                    serializer.Serialize(datawriter, value);
                    return ms.ToArray();
                }
            }
        }

        public static T FromBson<T>(byte[] data)
        {
            using (var ms = new MemoryStream(data))
            {
                using (var reader = new BsonDataReader(ms))
                {
                    var serializer = new JsonSerializer();
                    return serializer.Deserialize<T>(reader);
                }
            }
        }
    }
}
