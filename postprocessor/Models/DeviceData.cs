using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lcol.Models
{
    public enum DeviceType
    {
        Saures,
        Lora
    }

    public class Device
    {
        public int Id { get; set; }
        public DeviceType Type { get; set; }
        public string SerialNumber { get; set; }
        public string HardwareVersion { get; set; }
        public string FirmwareVersion { get; set; }
        public string Details { get; set; }

        public ICollection<Indication> Indications { get; set; }
    }

    public class Indication
    {
        public int Id { get; set; }
        public int Timestamp { get; set; }

        public string Channel { get; set; }
        public string Type { get; set; }
        public string Value { get; set; }
        public string Name { get; set; }
        public string State { get; set; }

        public int DeviceRefId { get; set; }

        [ForeignKey("DeviceRefId")]
        public Device Device { get; set; }

    }
}
