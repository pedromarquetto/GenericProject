using GenericMaui.Interfaces;
using GenericMaui.MVVM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Helper
{
    public static class CompanyManager
    {
        private static Company? _company;
        public static event Action OnChange;
        public static Company? Company
        {
            get => _company;
            private set
            {
                _company = value;
                OnChange?.Invoke();
            }
        }

        private static CompanyConfiguration? _companyConfig;
        public static CompanyConfiguration? CompanyConfig
        {
            get => _companyConfig;
            private set
            {
                _companyConfig = value;
                OnChange?.Invoke();
            }
        }
        public static async Task SetCompanyConfiguration(CompanyConfiguration config)
        {
            CompanyConfig = config;
        }
        public static async Task SetCompany(Company company)
        {
            Company = company;
        }
        public static bool IsAppLoaded { get; set; } = false;
    }
}
