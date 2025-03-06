namespace GenericBlazor.Shared.Models
{
    public class ItemPromotion
    {
        public int ItemPromotionId { get; set; }
        public string? Name { get; set; }
        public int? ItemCategoryId { get; set; }
        public int? ItemTypeId { get; set; }
        public decimal Rate { get; set; }
        public decimal FixedPrice { get; set; }
        public DateTime StartingDate { get; set; }
        public DateTime EndingDate { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
