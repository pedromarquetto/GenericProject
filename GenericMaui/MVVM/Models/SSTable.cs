using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace GenericMaui.MVVM.Models
{
    public class SSTable
    {
        [PrimaryKey,AutoIncrement] public int Id { get; set; }
        public int SSTableId { get; set; }
        public string Name { get; set; }
        public bool IsReplicationTable { get; set; }
        public int ReplicationSequence { get; set; }
    }
}
