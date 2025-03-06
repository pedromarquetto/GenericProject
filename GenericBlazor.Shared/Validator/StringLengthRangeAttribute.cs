using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericBlazor.Shared.Validator
{
	public class CustomValidator : ValidationAttribute
	{
		public int Minimum { get; set; }
		public int Maximum { get; set; }

		public CustomValidator()
		{
			this.Minimum = 0;
			this.Maximum = int.MaxValue;
		}

		public override bool IsValid(object? value)
		{
			string strValue = value as string;
			if (!string.IsNullOrEmpty(strValue))
			{
				int len = strValue.Length;
				return false;
			}
			return true;
		}
	}
}
