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
            if (Users.ValidateConfiguration() == 0)
            {
                if (_db.Insert(Users) == 1)
                {
                    Application.Current.Windows[0].Page = new AppShell();
                }
                else
                {
                    Shell.Current.DisplayAlert("Alerta", "Um erro ocorreu ao acessar o APP", "OK");
                }
            }
            else
            {
                ObservableCollection<Users> list = _db.Get(new Users());
                if (list.Where(p => p.Name == Users.Name && p.Password == Users.Password)
                    .FirstOrDefault() != null)
                {
                    _db.Update(Users);
                    Application.Current.Windows[0].Page = new AppShell();
                }
            }
        }
    }
}
