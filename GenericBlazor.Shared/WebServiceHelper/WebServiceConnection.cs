using Microsoft.JSInterop;
using Newtonsoft.Json;
using Syncfusion.Blazor.RichTextEditor.Internal;
using System.Net.Http.Headers;
using System.Text;

namespace GenericBlazor.Shared.WebServiceHelper
{
	public class WebServiceConnection
	{
		private readonly HttpClient _httpClient;

		public WebServiceConnection(HttpClient httpClient)
		{
			_httpClient = httpClient;
		}

		#region GetMethod
		public async Task<string> Get(string? route = "", string? parameters = "")
		{
			var result = "";
            //Se falha a conexão, tem que trocar a config da porta no launchSettings.json
            try
            {
                var response = await _httpClient.GetAsync($"/api/Main/{route}/{parameters}");

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

		#endregion

		#region PostMethod 

		public async Task<string> Post(string? route = "", string? table = "", string objectdata = "")
		{
			var result = "";

			try
			{
                var contentdata = new StringContent(objectdata, Encoding.UTF8, "application/json");
                var response = await _httpClient.PostAsync($"/api/Main/{route}/{table}", contentdata);

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

		public async Task<string> AddCookie(string? type = "",string? objectdata = "")
		{
			var result = "";
			try
			{
				var contentdata = new StringContent(objectdata, Encoding.UTF8, "application/json");
				var response = await _httpClient.PostAsync($"/api/Main/AddCookie/{type}", contentdata);

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

		#endregion

		#region PutMethod

		public async Task<string> Put(string? route = "", string? table = "", string objectdata = "")
		{
			var result = "";

			try
			{

				var contentdata = new StringContent(objectdata, Encoding.UTF8, "application/json");
                var response = await _httpClient.PutAsync($"/api/Main/{route}/{table}", contentdata);

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

		#endregion

	}
}



