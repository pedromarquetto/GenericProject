namespace GenericBlazor.Shared.Models
{
    public class SystemScreen
    {
        public int SystemScreenId { get; set; }
        public string? Name { get; set; }
		public string? Code { get; set; }
		public int MinUserLevel { get; set; }
        public bool IsActive { get; set; }
        public bool IsControlScreen { get; set; }
        public bool IsVisible { get; set; }
        public DateTime CreateDate { get; set; }
        public int SSTableId { get; set; }
        public int PresentationSequence { get; set; }


    }
}
