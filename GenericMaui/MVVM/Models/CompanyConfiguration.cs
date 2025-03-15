using GenericMaui.Sql;
using SQLite;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class CompanyConfiguration
    {
        [PrimaryKey, AutoIncrement] public int Id { get; set; }
        public int CompanyConfigurationId { get; set; }
        public int CompanyId { get; set; }
        public bool IsAppOffline { get; set; }
        public bool IsFreightPerNbHood { get; set; }
        public bool IsLoginWithPhone { get; set; }
        public bool IsLoginWithEmail { get; set; }
        public bool IsActive { get; set; } = true;
        public DateTime CreateDate { get; set; } = DateTime.Now;
        public string? LoadingMessage { get; set; } = "Loading";
        public bool IsShowScreenName { get; set; } = true;
        public bool IsDarkMode { get; set; } = false;
        public string? HeaderColor { get; set; } = "#810466";
        public string? FooterColor { get; set; } = "#810466";
        public string? FontColor { get; set; } = "#FFFFFF";
        public int LastReplicationId { get; set; } = 0;
        public int DaysOfReplicationAvailable { get; set; } = 7;
        public DateTime LastReplicationDateTime { get; set; }
        [Ignore] public List<CompanyArchive>? CompanyArchives { get; set; }

    }
}
