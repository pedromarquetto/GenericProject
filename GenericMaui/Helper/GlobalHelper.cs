using GenericMaui.Interfaces;
using GenericMaui.MVVM.Models.GenericModels;
using GenericMaui.MVVM.Views.CustomComponents;
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
        public static void SetBusyState(bool isBusy)
        {
            if (Shell.Current?.CurrentPage is PMSBasePage basePage)
            {
                basePage.IsBusyIndicatorVisible = isBusy;
            }
        }
    }
}
