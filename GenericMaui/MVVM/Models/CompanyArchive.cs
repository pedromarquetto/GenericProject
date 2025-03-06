using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class CompanyArchive
    {
        [AutoIncrement, PrimaryKey]
        public int Id { get; set; }
        public int CompanyArchiveId { get; set; }
        public int CompanyId { get; set; }
        public byte[]? Archive { get; set; }
        public int PresentationSequence { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
