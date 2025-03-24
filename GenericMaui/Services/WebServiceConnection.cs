using GenericMaui.Sql;
using Microsoft.Maui.ApplicationModel.Communication;
using Microsoft.TeamFoundation.TestManagement.WebApi;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Services
{
    public class WebServiceConnection
    {
        private static readonly HttpClient _httpClient = new HttpClient();
        private static HttpResponseMessage _response = new HttpResponseMessage();
        private static readonly string _url = "http://192.168.2.113:8085/api/Main/";
        //private static readonly string _url = "https://localhost:44341/api/Main/";
        public static List<object> Get(string? route = "",string? parameters = "")
        {
            List<object> list = new List<object>();
            var url = $"{_url}{route}/{parameters}";

            try
            {
                _response = _httpClient.GetAsync(url).Result;
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
        public static async Task<string> Post(string? route = "", string? table = "", string objectdata = "")
        {
            var result = "";

            try
            {
                var contentdata = new StringContent(objectdata, Encoding.UTF8, "application/json");
                var response = await _httpClient.PostAsync($"{_url}{route}/{table}", contentdata);

                if (response.IsSuccessStatusCode)
                {
                    string content = await response.Content.ReadAsStringAsync();
                    if (content != null)
                    {
                        result = content;
                    }
                    return result;
                }
                else
                {
                    return result;
                }
            }
            catch (Exception e)
            {
                return result;
            }
        }
    }
}
