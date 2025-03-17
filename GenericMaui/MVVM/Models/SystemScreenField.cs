using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class SystemScreenField
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int SystemScreenFieldId { get; set; }
        public int SystemScreenId { get; set; }
        public string? Name { get; set; }
        public string? Xname { get; set; }
        public string? FieldTypeName { get; set; }
        public bool IsVisible { get; set; }
        public bool IsDisabled { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
        public string? ModelField { get; set; }
        public int ValidationId { get; set; }
        public string? ValidationMessage { get; set; }
        public int PresentationSequence { get; set; }
    }
}
