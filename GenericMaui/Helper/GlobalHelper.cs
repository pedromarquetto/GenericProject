using GenericMaui.Interfaces;
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
        public static ObservableCollection<Type> GetModels()
        {
            ObservableCollection<Type> models = new ();

            Assembly assembly = Assembly.GetExecutingAssembly();

            foreach (Type type in assembly.GetTypes())
            {
                if (type.GetProperties().Any(prop => prop.GetCustomAttribute<PrimaryKeyAttribute>() != null))
                {
                    models.Add(type);
                }
            }
            return models;
        }

    }
}
