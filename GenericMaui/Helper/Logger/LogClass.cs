using GenericMaui.Helper.Enums;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Helper.Logger
{
    public class LogClass
    {
        [PrimaryKey,AutoIncrement] public int Id { get; set; }
        public string? Message { get; set; }
        public DateTime Date { get; set; }
        public LogTypeEnum LogType { get; set; }
    }
}
