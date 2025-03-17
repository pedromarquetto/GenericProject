using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class NbHood
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int NbHoodId { get; set; }
        public int CityId { get; set; }
        public string Name { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }

    }
}
