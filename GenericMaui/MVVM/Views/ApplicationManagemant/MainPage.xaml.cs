using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.ViewModels;
using GenericMaui.MVVM.Views.CustomComponents;
using GenericMaui.Sql;

namespace GenericMaui.MVVM.Views.ApplicationManagemant
{
    public partial class MainPage : PMSBasePage
    {
        public MainPage()
        {
            InitializeComponent();
            LoadScreenFields();
        }
    }

}
