using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GenericMaui.MVVM.Models;
using GenericMaui.Sql;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenericMaui.MVVM.ViewModels
{
    public partial class LoginViewModel : ObservableObject
    {
        private readonly SqlContext _db;
        public LoginViewModel(SqlContext sqlContext)
        {
            _db = sqlContext;
        }

        [ObservableProperty]
        public Users users = new();

        [RelayCommand]
        public void SignIn()
        {
            var list = _db.Get(Users);
            if (!list.Any())
            {
                if (_db.Insert(Users) == 1)
                {
                    Application.Current.Windows[0].Page = new AppShell(_db);
                }
                else
                {
                    Shell.Current.DisplayAlert("Alerta", "Um erro ocorreu ao acessar o APP", "OK");
                }
            }
            else
            {
                if (list.Where(p => p.Name == Users.Name && p.Password == Users.Password)
                    .FirstOrDefault() != null)
                {
                    Users.IsLoggedUser = true;
                    _db.Update(Users);
                    Application.Current.Windows[0].Page = new AppShell(_db);
                }
            }
        }
    }
}
