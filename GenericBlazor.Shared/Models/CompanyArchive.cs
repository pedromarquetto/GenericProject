using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericBlazor.Shared.Models
{
	public class CompanyArchive
	{
		public int CompanyArchiveId { get; set; }
		public int CompanyId { get; set; }
		public byte[]? Archive { get; set; }
		public int PresentationSequence { get; set; }
		public bool IsActive { get; set; }
		public DateTime CreateDate { get; set; }
	}
}
