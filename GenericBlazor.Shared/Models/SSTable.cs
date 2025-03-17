namespace GenericBlazor.Shared.Models
{
    public class SSTable
    {
        public int SSTableId { get; set; }
        public string Name { get; set; }
        public bool IsReplicationTable { get; set; }
        public int ReplicationSequence { get; set; }
    }
}
