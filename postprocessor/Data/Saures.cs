using System.Collections.Generic;

namespace Lcol.Data
{
    public class BaseJson
    {
        public virtual string Type { get; }
    }

    public class GetSaures : BaseJson
    {
        public override string Type { get { return "saures.get"; } }
        public int id { get; set; }
        public string sn { get; set; }
    }

    public class PostSaures : BaseJson
    {
        public override string Type { get { return "saures.post"; } }
        public Save json { get; set; }
    }

    public class Save
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
