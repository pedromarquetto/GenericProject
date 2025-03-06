using GenericMaui.Services;
using GenericMaui.Sql;
using Newtonsoft.Json;
using SQLite;
using System.Reflection;

namespace GenericMaui.Helper
{
    public class FirstConfiguration(int config)
    {
        readonly SqlContext _db = new SqlContext();
        readonly WebServiceConnection _ws = new WebServiceConnection();
        public List<Type> GetModels()
        {
            List<Type> models = new List<Type>();

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
        public int CheckFirstConfig()
        {
            if (config == 0)
            {
                try
                {
                    var i = GlobalHelper.GetModels();
                    foreach (var item in i)
                    {
                        var items = _ws.Get($"GetTable/{item.Name}");

                        var objectType = Type.GetType(item.FullName ?? "");

                        if (items?.Count > 0)
                        {
                            foreach (var itm in items)
                            {
                                var json = JsonConvert.SerializeObject(itm);
                                var converted = JsonConvert.DeserializeObject(json, objectType);
                                var idValue = objectType.GetProperty(objectType.Name.ToString()+"Id")?.GetValue(converted);
                                if (idValue != null)
                                {
                                    var newInstance = Activator.CreateInstance(objectType);
                                    var existingItem = _db.Get(newInstance).FirstOrDefault(x => x.GetType().GetProperty(objectType.Name.ToString() + "Id")?.GetValue(x).Equals(idValue) ?? false);

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
                    return 1;
                }
                catch (Exception e)
                {
                    return 0;
                }
            }
            else
            {
                return 2;
            }
        }
    }
}
