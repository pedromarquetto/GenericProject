using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class SystemScreen
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int SystemScreenId { get; set; }
        public string? Name { get; set; }
        public string? Code { get; set; }
        public int MinUserLevel { get; set; }
        public bool IsActive { get; set; }
        public bool IsControlScreen { get; set; }
        public bool IsVisible { get; set; }
        public bool IsAvailableOnMobile { get; set; }
        public DateTime CreateDate { get; set; }
        public int SSTableId { get; set; }
        public int PresentationSequence { get; set; }

    }
}
