using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class ConnectedDevice
    {
        public int ConnectedDeviceId { get; set; }
        public Guid DeviceUID { get; set; }
        public string? DeviceName { get; set; }
        public DateTime CreateDate { get; set; }
        public bool IsActive { get; set; }
    }
}
