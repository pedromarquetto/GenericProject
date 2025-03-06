using GenericMaui.MVVM.ViewModels;

namespace GenericMaui.MVVM.Views;


public partial class InitialScreen : ContentPage
{
	public InitialScreen()
	{
		InitializeComponent();
		BindingContext = new InitialScreenViewModel();
	}
}