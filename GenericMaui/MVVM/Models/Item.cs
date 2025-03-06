using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class Item
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int ItemId { get; set; }
        public int ItemTypeId { get; set; }
        public int ItemCategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public decimal SpecialPrice { get; set;}
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }
        public string? Generic1 { get; set; }
        public string? Generic2 { get; set; }
        public string? Generic3 { get; set; }
        public string? Generic4 { get; set; }
        public string? Generic5 { get; set; }
    }
}
