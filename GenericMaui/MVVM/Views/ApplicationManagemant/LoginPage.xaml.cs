using GenericMaui.Helper;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.ViewModels;
using GenericMaui.MVVM.Views.CustomComponents;
using GenericMaui.Sql;
using System.Collections.ObjectModel;

namespace GenericMaui.MVVM.Views.ApplicationManagemant;

public partial class LoginPage : PMSBasePage
{
    public LoginViewModel ViewModel { get; set; } = new LoginViewModel(new SqlContext());
    public LoginPage()
    {
        InitializeComponent();

        BindingContext = ViewModel;

        LoadScreenFields();
    }
    
}