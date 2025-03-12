using GenericMaui.Helper;
using GenericMaui.MVVM.Models;
using System.Collections.ObjectModel;

namespace GenericMaui.MVVM.Views.CustomComponents
{
    public partial class PMSBasePage : ContentPage
    {
        public PMSBasePage()
        {

        }
        public void LoadScreenFields(int screenId = 1)
        {
            ObservableCollection<SystemScreenField> list = FieldValidatior.GetFields($"{screenId.ToString()}");

            foreach (var item in list)
            {
                var field = FindByName(item.Xname);

                if (field == null) continue;

                var visible = field.GetType().GetProperty("IsVisible");
                var placeholder = field.GetType().GetProperty("Placeholder");
                var text = field.GetType().GetProperty("Text");
                visible?.SetValue(field, item.IsVisible);
                placeholder?.SetValue(field, item.Name);
                text?.SetValue(field, placeholder != null ? "" : item.Name);
            }
        }
    }
}