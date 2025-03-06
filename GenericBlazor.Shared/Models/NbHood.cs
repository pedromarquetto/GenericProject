using GenericBlazor.Shared.Validator;
using System.ComponentModel.DataAnnotations;

namespace GenericBlazor.Shared.Models
{
    public class NbHood
    {
        public int NbHoodId { get; set; }
        public int CityId { get; set; }
		public string? Name { get; set; }
        public decimal NbHoodFreight { get; set; }
		public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }

    }
}
