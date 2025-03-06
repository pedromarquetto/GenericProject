using GenericMaui.Sql;
using Microsoft.Maui.ApplicationModel.Communication;
using Microsoft.TeamFoundation.TestManagement.WebApi;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Services
{
    public class WebServiceConnection
    {
        readonly HttpClient _http = new HttpClient();
        internal HttpResponseMessage _response = new HttpResponseMessage();
        internal string _url = "http://192.168.2.113:8085/api/Main/";
        public WebServiceConnection()
        {
            
        }
        public List<object> Get(string? route = "",string? parameters = "")
        {
            List<object> list = new List<object>();
            var url = $"{_url}{route}/{parameters}";

            try
            {
                _response = _http.GetAsync(url).Result;
                if (_response.IsSuccessStatusCode)
                {
                    string content = _response.Content.ReadAsStringAsync().Result;
                    list = JsonConvert.DeserializeObject<List<object>>(content);
                    return list;
                }
                else
                {
                    return list;
                }
            }
            catch (Exception)
            {
                return null;
            }
            
        }
    }
}
