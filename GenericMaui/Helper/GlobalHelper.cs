using GenericMaui.Interfaces;
using GenericMaui.MVVM.Models.GenericModels;
using GenericMaui.MVVM.Views.CustomComponents;
using NPOI.HSSF.EventUserModel.DummyRecord;
using SQLite;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.Helper
{
    public static class GlobalHelper
    {
        public static ObservableCollection<ModelClass> GetModels()
        {
            ObservableCollection<ModelClass> models = new ();

            Assembly assembly = Assembly.GetExecutingAssembly();

            foreach (Type type in assembly.GetTypes())
            {
                if (type.GetProperties().Any(prop => prop.GetCustomAttribute<PrimaryKeyAttribute>() != null))
                {
                    models.Add( new ModelClass { Name = type.Name, FullName = type.FullName});
                }
            }
            return models;
        }
        public static async ValueTask SetBusyState(bool isBusy)
        {
            MainThread.BeginInvokeOnMainThread(() =>
            {
                if (Shell.Current?.CurrentPage is PMSBasePage basePage)
                {
                    basePage.IsBusyIndicatorVisible = isBusy;
                }
            });
            await Task.Delay(100);//Required
        }
        /// <summary>
        /// As per the calculation, generates a 10 digit number with 0.0000001% chance of having the same ID
        /// </summary>
        /// <returns></returns>
        public static async Task<int> GetRandomUniqueId() 
        {
            //2147483647 max value int

            var rand = new Random();

            // To decrease even more the chance of having the same ID, we add a random delay
            await Task.Delay(rand.Next(0,50));

            string timestampPart = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds().ToString();
            string yearLastDigit = DateTime.Now.Year.ToString().Substring(3);

            // last 2 digits of the timestamp
            timestampPart = string.Concat("1", yearLastDigit, timestampPart.Substring(timestampPart.Length - 2));

            // random number of 6 digits
            int randomPart = rand.Next(100000, 1000000);
            
            // 10 digits
            return int.Parse(timestampPart+randomPart.ToString());
        }
    }
}
