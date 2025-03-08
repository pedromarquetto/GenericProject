
using GenericMaui.Helper;
using GenericMaui.Helper.Enums;
using GenericMaui.Helper.Logger;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Views;
using GenericMaui.MVVM.Views.ApplicationManagemant;
using GenericMaui.Services;
using GenericMaui.Sql;
using Newtonsoft.Json;
using SQLite;
using System.Collections.ObjectModel;
using System.Reflection;

namespace GenericMaui
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
        }

        protected override Window CreateWindow(IActivationState? activationState)
        {
            LoginStateEnum fconfig = LoginStateEnum.NotConfigured;
            Users user = new Users();

            (fconfig, user) = FirstConfiguration.CheckFirstConfig();

            Page mainPage;

            if (fconfig == LoginStateEnum.UserLogged) // 1 first time // 2 not singed
            {
                mainPage = new AppShell();
            }
            else if (fconfig == LoginStateEnum.UserNotLogged)
            {
                mainPage = new LoginPage();
            }
            else
            {
                mainPage = new LoginPage(); // To add error page
            }

            return new Window(mainPage);
        }
    }

}
