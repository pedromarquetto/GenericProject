using CommunityToolkit.Mvvm.ComponentModel;
using GenericMaui.MVVM.Models;
using CommunityToolkit.Mvvm.Input;
using GenericMaui.Sql;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.ViewModels
{
    public partial class AppConfigurationViewModel : ObservableObject
    {
        private SqlContext _db;

        [ObservableProperty]
        private ObservableCollection<CompanyConfiguration> list = new();

        [ObservableProperty]
        private CompanyConfiguration model = new();

        public AppConfigurationViewModel()
        {
            _db = new SqlContext();
            list =  (ObservableCollection<CompanyConfiguration>)_db.Get(model);
        }

        [RelayCommand]
        public void Insert()
        {
            list.Add(model);
            _db.Insert(model);
        }
    }
}
