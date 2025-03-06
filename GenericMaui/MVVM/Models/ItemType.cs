using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class ItemType
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int ItemTypeId { get; set; }
        public string Name { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateTime { get; set; }

    }
}
