namespace GenericBlazor.Shared.Models
{
    public class Users
    {
        public int UsersId { get; set; }
        public string? Name { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public string? AdressStreet { get; set; }
        public int AdressNumber { get; set; }
        public int NbHoodId { get; set; }
        public string? CEP { get; set;}
        public byte[]? Archive { get; set; }
        public int UserTypeId { get; set; }
        public bool StaySigned { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
