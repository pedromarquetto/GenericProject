
using GenericMaui.Helper;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Views;
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
        private int config = 0;
        public App()
        {
            InitializeComponent();
        }
        //public void InitializeApp()
        //{
        //    if (config == 0 || config == 2) //0 first time //2 not signed
        //    {
        //        Application.Current.Windows[0].Page = new Login();
        //    }
        //    else
        //    {
        //        Application.Current.Windows[0].Page = new AppShell();
        //    }
        //}
        protected override Window CreateWindow(IActivationState? activationState)
        {
            var fconfig = new FirstConfiguration(config).CheckFirstConfig();
            Page mainPage;

            if (fconfig == 1 || fconfig == 2) // 1 first time // 2 not singed
            {
                mainPage = new AppShell();
            }
            else // 0 não concluído
            {
                mainPage = new Login();
            }

            return new Window(mainPage);
        }
    }

}
