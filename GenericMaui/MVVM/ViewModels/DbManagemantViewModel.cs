using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GenericMaui.Helper;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Models.GenericModels;
using GenericMaui.MVVM.Views;
using GenericMaui.MVVM.Views.ApplicationManagemant;
using GenericMaui.Sql;
using Newtonsoft.Json;
using System.Collections.ObjectModel;

namespace GenericMaui.MVVM.ViewModels
{
    public partial class DbManagemantViewModel : ObservableObject
    {
        private readonly SqlContext _db;

        public DbManagemantViewModel(SqlContext sqlContext)
        {
            _db = sqlContext;
            ModelNamesList = new ObservableCollection<string>(GlobalHelper.GetModels()?.Select(p => p.Name) ?? new ObservableCollection<string>());

            LineRecordsList = new ObservableCollection<LineRecord> { new LineRecord { Id=1,CompleteRecord="",Model="ABC" }
                , new LineRecord { Id = 2, CompleteRecord = "", Model = "DDD" } };

            OperationList = new ObservableCollection<string> { "Delete", "Refresh" };
        }

        [ObservableProperty]
        private ObservableCollection<string> operationList = new();

        [ObservableProperty]
        private string selectedOperation = "";

        [ObservableProperty]
        private ObservableCollection<string> modelNamesList = new();

        [ObservableProperty]
        private ObservableCollection<LineRecord> lineRecordsList = new();

        [ObservableProperty]
        private LineRecord selectedLineRecord = new();

        [ObservableProperty]
        private string selectedModelName = "";

        partial void OnSelectedLineRecordChanged(LineRecord value)
        {
            if (value != null)
            {
                //Del();
            }
        }
        partial void OnSelectedModelNameChanged(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                LoadItems();

                //Application.Current.OpenWindow(new Window (new MainPage { BindingContext = new MainPageViewModel(_db)}));
            }
        }

        partial void OnSelectedOperationChanged(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                var op = value;
                if (op == "Refresh")
                {
                    var isContinue = Shell.Current.CurrentPage.DisplayAlert("Warning", "This operation will restore all the data and may take some time, do you want to continue?"
                        , "Yes","No").Result;

                    if (isContinue)
                    {
                        FirstConfiguration.CheckFirstConfig(true);

                        LoadItems();
                    }
                }
            }
        }
        public void LoadItems()
        {
            var selected = selectedModelName;
            if (string.IsNullOrEmpty(selected))
            {
                return;
            }
            var obj = "GenericMaui.MVVM.Models." + selected;
            var objectType = Type.GetType(obj);
            var newInstance = Activator.CreateInstance(objectType);
            var i = _db.Get(newInstance);
        
            if (i.Count > 0)
            {
                ObservableCollection<LineRecord> Items = new();
                foreach (var item in i)
                {
                    var prop = item.GetType().GetProperty("Id");
                    var id = prop.GetValue(item);
                    Items.Add(new LineRecord
                    {
                        Id = (int)id,
                        CompleteRecord = JsonConvert.SerializeObject(item),
                        Model = obj
                    });
                }
                LineRecordsList = Items;
            }
            else
            {
                LineRecordsList?.Clear();
                if (selected == "CompanyConfiguration" && i.Count <= 0)
                {
                    if (Application.Current?.Windows?.Count > 0)
                    {
                        Application.Current.Windows[0].Page = new LoginPage();
                    }
                }
            }
        }

        public async void Del()
        {
            var op = SelectedOperation;
            LineRecord selected = selectedLineRecord;
            var objectType = Type.GetType(selected.Model);
            var newInstance = Activator.CreateInstance(objectType);

            var item = JsonConvert.DeserializeObject(selected.CompleteRecord, objectType);

            if (op == "Delete")
            {
                //Shell.Current.CurrentPage.DisplayAlert("Alert", "Please provide password", "OK");

                //await Task.Delay(3000);

                //Shell.Current.CurrentPage.DisplayAlert("Alert", "Please provide password", "OK");

                bool confirm = true;
                if (confirm)
                {
                    _db.Delete(item);
                }
                LoadItems();
            }
        }
    }
}
