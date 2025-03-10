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
    public class Users
    {
        [PrimaryKey]
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public string? AdressStreet { get; set; }
        public string? AdressNumber { get; set; }
        public string? NbHoodId { get; set; }
        public string? CEP { get; set;}
        public byte[]? Archive { get; set; }
        public int UserTypeId { get; set; }
        public bool StaySigned { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
        public bool IsLoggedUser { get; set; }// used for identify the user from the current machine

    }
}
