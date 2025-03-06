using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.Models
{
    public class Company
    {
        [PrimaryKey,AutoIncrement]
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string CompanyName2 { get; set;}
        public string CompanyAdressStreet { get; set; }
        public decimal CompanyAdressNumber { get; set; }
        public int CompanyNbHood { get; set; }
        public string CompanyPhone { get; set; }
        public string CompanyEmail { get; set; }
        public int CompanyType { get; set; }
        public string CEP { get; set; }
        public string CompanyFacebookURL { get; set; }
        public string CompanyInstagramURL { get; set; }
        public string CompanyLinkedinURL { get; set; }
        public string CompanySiteURL { get; set; }
        public string CompanyApiURL { get; set; }
        public byte[] CompanyLogo { get; set; }
        public int IsActive { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime InactiveDate { get; set; }

    }
}
