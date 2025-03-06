using GenericBlazor.Shared.WebServiceHelper;
using Newtonsoft.Json;
using Syncfusion.Blazor.DropDowns;
using Syncfusion.Blazor.RichTextEditor.Internal;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericBlazor.Shared.Models.ModelHelper
{
	public static class GlobalHelper
	{

		#region Methods
		public static async Task<Tuple<List<DropdownListItems>, DropdownListItems>> DropDownList(WebServiceConnection ws, string tablename, int? id = null)
		{
			var list = new List<DropdownListItems>();
			var selected = new DropdownListItems();

			var response = await ws.Get("GetTable", tablename);

			var type = Type.GetType($"GenericBlazor.Shared.Models.{tablename}, GenericBlazor.Shared");//Get the type based on the name

			var listType = typeof(List<>).MakeGenericType(type);//Create the list for the object
			var items = JsonConvert.DeserializeObject(response, listType) as IEnumerable<object>;

			var properties = type?.GetProperties();
			if (properties != null)
			{
				foreach (var item in items)
				{
					var valueProperty = properties.FirstOrDefault(p => p.Name.Equals($"{tablename}Id", StringComparison.OrdinalIgnoreCase));
					var textProperty = properties.FirstOrDefault(p => p.Name.Equals("Name", StringComparison.OrdinalIgnoreCase));

					if (valueProperty != null && textProperty != null)
					{
						var value = Convert.ToInt32(valueProperty.GetValue(item));
						var text = textProperty.GetValue(item)?.ToString();

						list.Add(new DropdownListItems { Value = value, Description = text });

						selected = value == id ? new DropdownListItems { Description = text, Value = value } : selected;
					}


				}
			}

			return Tuple.Create(list, selected);
		}

		public static async Task<Tuple<List<SystemScreenField>, SystemScreen>> GetScreenFields(WebServiceConnection ws, string screenname)
		{
			var fieldsList = new List<SystemScreenField>();
			var screen = new SystemScreen();

			string screenJson = await ws.Get("GetTableByName", $"SystemScreen/{screenname}");
			if (!string.IsNullOrEmpty(screenJson))
			{
				screen = JsonConvert.DeserializeObject<SystemScreen>(screenJson);
				if (screen != null)
				{
					var screenfieldsJson = await ws.Get("GetTableByParentId", $"SystemScreen/SystemScreenField/{screen.SystemScreenId.ToString()}");
					if (screenfieldsJson != null && screenfieldsJson != "")
					{
						fieldsList = JsonConvert.DeserializeObject<List<SystemScreenField>>(screenfieldsJson)
							.OrderBy(p => p.PresentationSequence).ToList();
                    }
				}
			}
			else
			{
				return Tuple.Create(fieldsList, screen);
			}

			return Tuple.Create(fieldsList, screen);
		}

        public static async Task<IQueryable<T>> GetTableData<T>(WebServiceConnection ws, IQueryable<T> ObjectList, string tablename)
        {
            var response = await ws.Get("GetTable", tablename);

			if (!string.IsNullOrEmpty(response))
			{
                ObjectList = JsonConvert.DeserializeObject<List<T>>(response).AsQueryable();
            }
            
            return ObjectList;
        }

		#endregion
	}
}
