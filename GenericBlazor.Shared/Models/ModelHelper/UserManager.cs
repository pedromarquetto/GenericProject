using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;


namespace GenericBlazor.Shared.Models.ModelHelper
{
    public class UserManager : IUserManager
    {
        private Users? _currentUser;

        public event Action OnUserChanged;

        public Users? CurrentUser
        {
            get => _currentUser;
            private set
            {
                _currentUser = value;
                OnUserChanged?.Invoke();
            }
        }

        public async Task SetCurrentUser(Users user)
        {
            CurrentUser = user;
        }

        public async Task SetCookie(IJSRuntime js, string data, int? days = 30,string type = "")
        {
            if (type == "Users")
            {
				var user = JsonConvert.DeserializeObject<Users>(data, new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Include
                });

				user.Archive = null;
                data = JsonConvert.SerializeObject(user, new JsonSerializerSettings
                { NullValueHandling = NullValueHandling.Include });
			}
			await js.InvokeVoidAsync("setCookie", "User", data, days);
        }

        public async Task DeleteCookie(IJSRuntime js, string type)
        {
            await js.InvokeVoidAsync("deleteCookie", type);
        }

        public async Task<string> GetCookie(IJSRuntime js, string type)
        {
            return await js.InvokeAsync<string>("getCookie", type);
        }
    }

}
