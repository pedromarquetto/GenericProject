using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GenericMaui.MVVM.Models;
using GenericMaui.Sql;
using System.Collections.ObjectModel;

namespace GenericMaui.MVVM.ViewModels
{
    public partial class InitialScreenViewModel : ObservableObject
    {
        private SqlContext _db;

        //[ObservableProperty]
        //private ObservableCollection<GenericObject> list = new();
        //[ObservableProperty]
        //private GenericObject model = new();

        public InitialScreenViewModel()
        {

            //_db = new SqlContext();
            //list = _db.Get(model);
        }

        [RelayCommand]
        public void Insert()
        {
            //list.Add(model);
            //_db.Insert(model);
        }


    }
}
