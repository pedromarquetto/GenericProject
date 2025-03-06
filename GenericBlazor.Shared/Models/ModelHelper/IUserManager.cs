using Microsoft.JSInterop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericBlazor.Shared.Models.ModelHelper
{
    public interface IUserManager
    {
        event Action OnUserChanged;
        Users? CurrentUser { get; }
        Task SetCurrentUser(Users user);
        Task SetCookie(IJSRuntime js, string data, int? days = 30,string type = "");
        Task DeleteCookie(IJSRuntime js, string type);
        Task<string> GetCookie(IJSRuntime js, string type);
    }
}
