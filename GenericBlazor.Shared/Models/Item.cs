using GenericBlazor.Shared.Validator;
using GenericBlazor.Shared.WebServiceHelper;
using System.ComponentModel.DataAnnotations;

namespace GenericBlazor.Shared.Models
{
    public class Item
    {
        public int ItemId { get; set; }
        public int ItemTypeId { get; set; }
        public int ItemCategoryId { get; set; }
		public string? Name { get; set; }
		public string? Description { get; set; }
        public decimal Price { get; set; }
        public decimal SpecialPrice { get; set;}
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
        public string? Generic1 { get; set; }
        public string? Generic2 { get; set; }
        public string? Generic3 { get; set; }
        public string? Generic4 { get; set; }
        public string? Generic5 { get; set; }

    }


}
