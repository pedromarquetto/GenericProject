
using GenericMaui.Helper;
using GenericMaui.Helper.Enums;
using GenericMaui.Helper.Logger;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.ViewModels;
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
            return new Window(new InitialPage { BindingContext = new InitialViewModel(new SqlContext()) });
        }
    }

}
