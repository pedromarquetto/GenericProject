using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class CompanyTypes
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int CompanyTypesId { get; set; }
        public string TypeName { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }

    }
}
