using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GenericMaui.MVVM.Models;
using GenericMaui.Sql;
using System.Collections.ObjectModel;

namespace GenericMaui.MVVM.ViewModels
{
    public partial class MainPageViewModel : ObservableObject
    {
        private SqlContext _db;

        [ObservableProperty]
        private ObservableCollection<CompanyArchive> companyArchiveList = new();

        [ObservableProperty]
        private Item model = new();

        public MainPageViewModel(SqlContext sqlContext)
        {
            _db = sqlContext;
            CompanyArchiveList = _db.Get(new CompanyArchive());
        }

        [RelayCommand]
        public void Insert()
        {
            //list.Add(model);
            Application.Current.Resources["TextColorPMS"] = Colors.Blue;
            //_db.Insert(model);
        }


    }
}
