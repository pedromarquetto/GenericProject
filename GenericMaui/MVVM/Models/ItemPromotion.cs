using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class ItemPromotion
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; } 
        public int ItemPromotionId { get; set; }
        public string Name { get; set; }
        public int? ItemCategoryId { get; set; }
        public int? ItemTypeId { get; set; }
        public decimal Rate { get; set; }
        public decimal FixedPrice { get; set; }
        public DateTime StartingDate { get; set; }
        public DateTime EndingDate { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
