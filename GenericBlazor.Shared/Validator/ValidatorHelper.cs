using GenericBlazor.Shared.Models;
using GenericBlazor.Shared.WebServiceHelper;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GenericBlazor.Shared.Validator
{
	public class ValidatorHelper
	{
		public List<ValidatorModel> Validate<T>(T item,List<SystemScreenField> sSF) 
		{
			List<ValidatorModel> validators = new List<ValidatorModel>();
			var obj = Type.GetType(item.GetType().FullName);
			var instance = Activator.CreateInstance(obj);
			instance = item;

			foreach (var i in instance.GetType().GetProperties())
			{
				var IsByte = false;
				if (i.PropertyType == typeof(byte[])) { IsByte = true; }

				var value = IsByte == false ? i.GetValue(instance)?.ToString() : "";

				var screenfield = sSF.FirstOrDefault(p => p.ModelField == i.Name);
				if (screenfield?.ValidationId != null && (screenfield.IsVisible))
				{
					if (!IsValid(screenfield.ValidationId, value,(IsByte == true ? (byte[])i.GetValue(instance) : null)))
					{
						validators.Add(new ValidatorModel { PropertyName = i.Name, ValidationMessage = screenfield.ValidationMessage });
						return validators;
					}
				}
			}
			return validators;
		}

		public bool IsValid(int validationId, string? stringvalue, byte[] byteArray = null)
		{
			switch (validationId)
			{
				case 1: //Emptystring
					return string.IsNullOrEmpty(stringvalue) == false ? true : false;
				case 2://Zero Value
					return stringvalue == "0" ? false : true;
				case 3://Archive Size
					var result = false;
					const int CookieSizeLimit = 4096;
					if (byteArray != null)
					{
						var base64Image = Convert.ToBase64String(byteArray);
						var imgSize = base64Image.Length;
						return imgSize <= CookieSizeLimit;
					}
					return result;
                case 4://None
					return true;
                default:
					return true;
			}
		}
	}
}
