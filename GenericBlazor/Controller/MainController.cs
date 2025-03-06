using GenericBlazor.General;
using GenericBlazor.Shared.Models;
using GenericBlazor.Shared.Models.ModelHelper;
using GenericBlazor.Shared.WebServiceHelper;
using GenericBlazor.SqlContext;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.JSInterop;
using Newtonsoft.Json;
using System.Collections;
using System.Data.Common;
using System.Data.SqlClient;
using System.Net.Http;

namespace GenericBlazor.Controller
{
	[Route("api/[controller]")]
	[ApiController]

	public class MainController : ControllerBase
	{
		private readonly HttpContextAccessor _http;
		private readonly IConfiguration _configuration;
		private readonly SqlContext.SqlContext _db;
        //private readonly IJSRuntime _js;
		
		//The api will not work if something went wrong with the initialization of it 

		public MainController(IConfiguration configuration)
		{
			_configuration = configuration;
			_http = new HttpContextAccessor();
			_db = new SqlContext.SqlContext(_configuration);
            //_js = jSRuntime;
		}

        #region MAUI




        #endregion

        #region GetMethod

        [HttpGet, Route("GetTable/{table}")]
		public string GetTable(string table)
		{
			return _db.GetTable(table);
		}

		[HttpGet, Route("GetTableById/{table}/{id}")]
		public string GetTableById(string table, int id)
		{
			return _db.GetTableById(table, id);
		}

		[HttpGet, Route("GetTableByName/{table}/{name}")]
		public string GetTableByName(string table, string name)
		{
			return _db.GetTableByName(table, name);
		}

		[HttpGet, Route("GetTableWithChild/{table}/{parenttable}")]
		public string GetTableWithChild(string table, string parenttable)
		{
			return _db.GetTableWithChild(table, parenttable);
		}

		[HttpGet, Route("GetTableByParentId/{table}/{parenttable}/{id}")]
		public string GetTableByParentId(string table, string parenttable, int id)
		{
			return _db.GetTableByParentId(table, parenttable, id);
		}

		[HttpGet, Route("GetJsonDataFromProcedure/{procedure}/{parameters?}")]
		public string GetJsonDataFromProcedure(string procedure, string? parameters = "")
		{
			var result = _db.GetJsonDataFromProcedure(procedure, parameters); //Parameters should be separated with a comma (,) and using '' in text parameters			

			var response = new ApiResponse
			{
				ReturnId = result.Item1,
				Message = result.Item2
			};

			return JsonConvert.SerializeObject(response);
		}

		#endregion

		#region PostMethod 

		[HttpPost, Route("PostObject/{table}")]
		public string PostObject(string table)
		{
			var query = "";
			var result = "";
			var objectdata = "";
			var parameters = new List<SqlParameter>();
			byte[] byteArray = null;

			using (var reader = new StreamReader(Request.Body))
			{
				objectdata = reader.ReadToEndAsync().Result;
			}

			var type = Type.GetType($"GenericBlazor.Shared.Models.{table}, GenericBlazor.Shared");//Pega o Type pelo nome
			var properties = type?.GetProperties().Where(p => p.Name != $"{table}Id"); // Pega as properties menos a Id
			if (properties != null)
			{
				var columnNames = string.Join(", ", properties.Select(p => p.Name));
				var obj = JsonConvert.DeserializeObject(objectdata, type);
				var strInsert = "";
				var propCount = properties.Count();
				var cnt = 0;

				foreach (var i in properties)
				{
					if (i.PropertyType == typeof(List<>))
					{
						var a = 1;
					}
					cnt += 1;
					if (i.PropertyType.Name == "DateTime")
					{
						DateTime dateTimeValue = Convert.ToDateTime(i.GetValue(obj));
						strInsert = strInsert + $"'{dateTimeValue.ToString("yyyy-MM-dd")}'";
					}
					else if (i.PropertyType.Name == "Decimal")
					{
						strInsert = strInsert + $"{i.GetValue(obj).ToString().Replace(",", ".")}";
					}
					else if (i.PropertyType.Name == "Boolean")
					{
						var val = i.GetValue(obj).ToString() == "True" ? "1" : "0";
						strInsert = strInsert + $"{val}";
					}
					else if (i.PropertyType == typeof(byte[]))
					{
						byteArray = (byte[])i.GetValue(obj);
						strInsert = strInsert + $"@Archive";
						parameters.Add(new SqlParameter("@Archive", byteArray));
					}
					else
					{
						strInsert = strInsert + $"'{i.GetValue(obj)}'";
					}
					strInsert = propCount != cnt ? strInsert + "," : strInsert;
				}

				query = $"INSERT INTO {table} ({columnNames}) VALUES ({strInsert})";

				result = _db.CustomInsertQuery(query,parameters.ToArray());
			}
			return result;
		}

        #endregion

        #region PutMethod

        [HttpPut, Route("PutObject/{table}")]
		public string PutObject(string table)
		{
			var objectdata = "";
			var query = "";
			var result = "";
			var parameters = new List<SqlParameter>();
			byte[] byteArray = null;

			using (var reader = new StreamReader(Request.Body))
			{
				objectdata = reader.ReadToEndAsync().Result;
			}
			
			var type = Type.GetType($"GenericBlazor.Shared.Models.{table}, GenericBlazor.Shared");//Pega o Type pelo nome
			var properties = type?.GetProperties().Where(p => p.Name != $"{table}Id"); // Pega as properties menos a Id
			var propertyList = properties;
			if (properties != null)
			{
				var obj = JsonConvert.DeserializeObject(objectdata, type);
				var strUpdate = "";
				var propCount = propertyList.Where(p => !(p.PropertyType.IsGenericType
					&& p.PropertyType.GetGenericTypeDefinition() == typeof(List<>))).Count();
				var cnt = 0;

				foreach (var i in propertyList.Where(p => !(p.PropertyType.IsGenericType 
					&& p.PropertyType.GetGenericTypeDefinition() == typeof(List<>))))
				{
					cnt += 1;
					strUpdate = strUpdate + $"{i.Name.ToString()} = ";
					if (i.PropertyType.Name == "DateTime")
					{
						DateTime dateTimeValue = Convert.ToDateTime(i.GetValue(obj));
						strUpdate = strUpdate + $"'{dateTimeValue.ToString("yyyy-MM-dd")}'";
					}
					else if (i.PropertyType.Name == "Decimal")
					{
						strUpdate = strUpdate + $"{i.GetValue(obj).ToString().Replace(",", ".")}";
					}
					else if (i.PropertyType.Name == "Boolean")
					{
						var val = i.GetValue(obj).ToString() == "True" ? "1" : "0";
						strUpdate = strUpdate + $"{val}";
					}
					else if (i.PropertyType == typeof(byte[]))
					{
						byteArray = (byte[])i.GetValue(obj);
						strUpdate = strUpdate + $"@Archive";
						parameters.Add(new SqlParameter("@Archive", byteArray));
					}
					else
					{
						strUpdate = strUpdate + $"'{i.GetValue(obj)}'";
					}
					strUpdate = propCount != cnt ? strUpdate + "," : strUpdate;
				}
				var id = type?.GetProperty($"{table}Id").GetValue(obj);
				query = $"UPDATE {table} SET {strUpdate} where {table}id = {id}";
				
				result = _db.CustomInsertQuery(query, parameters.ToArray());
			}
			return result;
		}

		#endregion

		#region Authentication 

		//[HttpPost, Route("AddCookie/{Type}/{data?}")]
		//public IActionResult AddCookie(string Type, string? data)
		//{
		//	var objectdata = "";

		//	using (var reader = new StreamReader(Request.Body))
		//	{
		//		objectdata = reader.ReadToEndAsync().Result;
		//	}

		//	if (!string.IsNullOrEmpty(data) && string.IsNullOrEmpty(objectdata))
		//	{
		//		objectdata = data;
		//	}

		//	if (Type == "Users")
		//	{
		//		_js.InvokeVoidAsync("setCookie", "User", objectdata, 30);
		//	}

		//	return Ok("Cookie Set");
		//}

		//[HttpGet, Route("GetCookie/{Type}")]
		//public IActionResult GetCookie(string Type)
		//{
		//	var result = "";
		//	if (Type == "Users")
		//	{
		//		result = _http.HttpContext.Request.Cookies["User"];
		//	}

		//	return Ok(result);
		//}

		#endregion
	}

}
