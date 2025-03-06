namespace GenericBlazor.Shared.Models
{
    public class State
    {
        public int StateId { get; set; }
        public int CountryId { get; set; }
        public string? Name { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }

    }
}
