using GenericMaui.MVVM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Interfaces
{
    public interface ICompanyManager
    {
        event Action OnChange;
        Company? Company { get; }
        CompanyConfiguration? CompanyConfig { get; }
        Task SetCompanyConfiguration(CompanyConfiguration config);
        Task SetCompany(Company company);

    }
}
