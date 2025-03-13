using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GenericMaui.Helper;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Models.GenericModels;
using GenericMaui.MVVM.Views;
using GenericMaui.MVVM.Views.ApplicationManagemant;
using GenericMaui.Sql;
using Microsoft.TeamFoundation.Common;
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
            ModelNamesList = GlobalHelper.GetModels();

            OperationList = new ObservableCollection<string> { "Delete", "Refresh", "RefreshAll" };
        }

        [ObservableProperty]
        private ObservableCollection<string> operationList = new();

        [ObservableProperty]
        private string selectedOperation = "";

        [ObservableProperty]
        private ObservableCollection<ModelClass> modelNamesList = new();

        [ObservableProperty]
        private ObservableCollection<LineRecord> lineRecordsList = new();

        [ObservableProperty]
        private LineRecord selectedLineRecord = new();

        [ObservableProperty]
        private ModelClass selectedModelName;

        partial void OnSelectedLineRecordChanged(LineRecord value)
        {
            if (value != null)
            {
                Del();
            }
        }
        partial void OnSelectedModelNameChanged(ModelClass value)
        {
            if (!string.IsNullOrEmpty(value?.Name))
            {
                LoadItems();

                //Application.Current.OpenWindow(new Window (new MainPage { BindingContext = new MainPageViewModel(_db)}));
            }
        }
        async partial void OnSelectedOperationChanged(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                var op = value;
                if (op == "RefreshAll")
                {

                    var isContinue = await Shell.Current.CurrentPage.DisplayAlert("Warning", "This operation will restore all the data and may take some time, do you want to continue?"
                        , "Yes", "No");

                    GlobalHelper.SetBusyState(true);

                    if (isContinue)
                    {
                        FirstConfiguration.CheckFirstConfig(true);

                        LoadItems();
                    }

                    GlobalHelper.SetBusyState(false);
                }
                else if (op == "Refresh")
                {
                    if (!string.IsNullOrEmpty(SelectedModelName?.Name))
                    {
                        FirstConfiguration.CheckFirstConfig(true, SelectedModelName.Name);
                        LoadItems();
                    }
                }
            }
        }
        public void LoadItems()
        {
            if (string.IsNullOrEmpty(SelectedModelName?.Name))
            {
                return;
            }
            var obj = "GenericMaui.MVVM.Models." + SelectedModelName.Name;
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
                if (SelectedModelName.Name == "CompanyConfiguration" && i.Count <= 0)
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
