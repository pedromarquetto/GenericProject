namespace GenericBlazor.Shared.Models
{
	public class Company
    {
        public int CompanyId { get; set; }
        public string? CompanyName { get; set; }
        public string? CompanyName2 { get; set;}
        public string? CompanyAdressStreet { get; set; }
        public int CompanyAdressNumber { get; set; }
        public int NbHoodId { get; set; }
        public string? CompanyPhone { get; set; }
        public string? CompanyEmail { get; set; }
		public int CompanyTypesId { get; set; }
        public string? CEP { get; set; }
        public string? CompanyFacebookURL { get; set; }
		public string? CompanyInstagramURL { get; set; }
		public string? CompanyLinkedinURL { get; set; }
		public string? CompanySiteURL { get; set; }
		public string? CompanyApiURL { get; set; }
		public byte[]? CompanyLogo { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime InactiveDate { get; set; }

    }
}
