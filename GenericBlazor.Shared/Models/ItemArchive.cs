namespace GenericBlazor.Shared.Models
{
    public class ItemArchive
    {
        public int ItemArchiveId { get; set; }
        public int ItemId { get; set; }
		public byte[]? Archive { get; set; }
        public int PresentationSequence { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
