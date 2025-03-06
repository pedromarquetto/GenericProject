using GenericMaui.Helper;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Views.CustomComponents;
using GenericMaui.Sql;
using System.Collections.ObjectModel;

namespace GenericMaui.MVVM.Views;

public partial class Login : PMSBasePage
{
	public Login()
    {
        InitializeComponent();
        LoadScreenFields();
    }
    
}