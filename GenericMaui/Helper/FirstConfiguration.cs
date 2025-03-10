using GenericMaui.Helper.Enums;
using GenericMaui.Helper.Logger;
using GenericMaui.MVVM.Models;
using GenericMaui.Services;
using GenericMaui.Sql;
using Newtonsoft.Json;
using SQLite;
using System.Reflection;
using static Microsoft.VisualStudio.Services.Graph.Constants;

namespace GenericMaui.Helper
{
    public static class FirstConfiguration
    {
        private static readonly SqlContext _db = new SqlContext();
        public static Tuple<LoginStateEnum,Users> CheckFirstConfig(bool isForceReconfiguration = false)
        {
            var user = new Users();
            LoginStateEnum state = isForceReconfiguration ? LoginStateEnum.NotConfigured : GetInitializationState();

            if (state == LoginStateEnum.NotConfigured)
            {
                try
                {
                    var i = GlobalHelper.GetModels();
                    foreach (var item in i)
                    {
                        // Get all the elements from the table in the server
                        var items = WebServiceConnection.Get($"GetTable/{item.Name}");

                        var objectType = Type.GetType(item.FullName ?? "");

                        if (objectType == null) continue;

                        // Loop all the found items and insert/update them into SQLLite
                        if (items.Any())
                        {
                            foreach (var itm in items)
                            {
                                var json = JsonConvert.SerializeObject(itm);
                                var converted = JsonConvert.DeserializeObject(json, objectType);
                                var idValue = objectType.GetProperty(objectType.Name.ToString()+"Id")?.GetValue(converted);
                                if (idValue != null)
                                {
                                    var newInstance = Activator.CreateInstance(objectType);

                                    // Check if the item already exists in the database with the same "Model Name + ID"
                                    var existingItem = _db.Get(newInstance)?.FirstOrDefault(x => x?.GetType().GetProperty(objectType.Name.ToString() + "Id")?
                                        .GetValue(x).Equals(idValue) ?? false);

                                    if (existingItem != null)
                                    {
                                        _db.Update(converted);
                                    }
                                    else
                                    {
                                        _db.Insert(converted);
                                    }
                                }
                            }
                        }
                    }
                    return Tuple.Create(LoginStateEnum.UserNotLogged, user);
                }
                catch (Exception ex)
                {
                    return Tuple.Create(LoginStateEnum.NotConfigured, user);
                }
            }
            else
            {
                var loggedUser = _db.Get(new Users()).FirstOrDefault(p => p.IsLoggedUser && p.StaySigned);
                return Tuple.Create(loggedUser != null ? LoginStateEnum.UserLogged : LoginStateEnum.UserNotLogged, loggedUser != null ? loggedUser : user);
            }
        }
        public static LoginStateEnum GetInitializationState()
        {
            LoginStateEnum state = LoginStateEnum.NotConfigured;

            if (_db.Get(new CompanyConfiguration()).Any())
            {
                state = LoginStateEnum.Configured;
            }

            return state;
        }

    }
}
