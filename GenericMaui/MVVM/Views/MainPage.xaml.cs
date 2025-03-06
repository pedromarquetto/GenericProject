using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.ViewModels;
using GenericMaui.MVVM.Views.CustomComponents;
using GenericMaui.Sql;

namespace GenericMaui.MVVM.Views
{
    public partial class MainPage : PMSBasePage
    {
        private SqlContext _database;
        private MainPageViewModel _vm;
        public MainPage()
        {
            InitializeComponent();
            
            lblMain.Text = "New Generic Maui Project";
        }
        private void OnCounterClicked(object sender, EventArgs e)
        {
            DisplayAlert("Inserido", "Inserido.", "OK");
            //DisplayAlert("Erro", "Algum erro ocorreu.", "OK");        
        }
        private void Button_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new MainPage());
        }
    }

}
