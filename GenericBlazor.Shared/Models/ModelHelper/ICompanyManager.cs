using GenericBlazor.Shared.WebServiceHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericBlazor.Shared.Models.ModelHelper
{
    public interface ICompanyManager
    {
		event Action OnChange;
		Company? Company { get;}
        CompanyConfiguration? CompanyConfig { get; }
        Task SetCompanyConfiguration(CompanyConfiguration config);
        Task SetCompany(Company company);

        

    }
}
