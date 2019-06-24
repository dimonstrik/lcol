using System;
using System.Security.Cryptography;

namespace Lcol.Models
{
    public class RawData : BsonData
    {
        public int Id { get; set; }
        public DateTime AddDateTime { get; set; }
        public byte[] Blob { get; set; }

        public string GetHexBlob ()
        {
            return BitConverter.ToString(Blob).Replace("-", "");
        }

        public string GetBlobMd5()
        {
            var md5 = (new MD5CryptoServiceProvider()).ComputeHash(Blob);
            return BitConverter.ToString(md5).Replace("-", "");
        }
    }
}
