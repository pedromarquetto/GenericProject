using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class ItemCategory
    {
        public int Id { get; set; } 
        public int ItemCategoryId { get; set; }
        public string Name { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
