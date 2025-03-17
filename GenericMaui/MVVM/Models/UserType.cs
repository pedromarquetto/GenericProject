using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class UserType
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int UserTypeId { get; set; }
        public string Name { get; set; }
        public int TypeLvel { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }

    }
}
