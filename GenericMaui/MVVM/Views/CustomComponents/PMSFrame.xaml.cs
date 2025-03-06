using GenericMaui.Helper;

namespace GenericMaui.MVVM.Views.CustomComponents;

public partial class PMSFrame : Frame
{
	public PMSFrame()
	{
		InitializeComponent();
        frm.BackgroundColor = Color.FromRgba(CompanyManager.CompanyConfig.FooterColor);
    }
}