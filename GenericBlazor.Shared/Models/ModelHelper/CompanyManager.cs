using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericBlazor.Shared.Models.ModelHelper
{
    public class CompanyManager : ICompanyManager
    {
        
        private Company? _company;
        public event Action OnChange;
		public Company? Company
        {
            get => _company;
            private set
            {
                _company = value;
                OnChange?.Invoke();
            }
        }

        private CompanyConfiguration? _companyConfig;
        public CompanyConfiguration? CompanyConfig
        {
            get => _companyConfig;
            private set
            {
                _companyConfig = value;
                OnChange?.Invoke();
            }
        }
        public async Task SetCompanyConfiguration(CompanyConfiguration config)
        {
            CompanyConfig = config;
        }
        public async Task SetCompany(Company company)
        {
            Company = company;
        }
        
    }
}
