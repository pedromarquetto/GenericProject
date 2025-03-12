using System.Collections.ObjectModel;
using System.Reflection;

namespace GenericMaui.MVVM.Views.CustomComponents;

public partial class PMSAutoSuggestBox : ContentView
{
    private bool isDropDownOpen = false;
    public bool IsDropDownOpen 
    { 
        get => isDropDownOpen;
        set
        {
            isDropDownOpen = value;
            OnPropertyChanged();
        }
    }
    public int AbsoluteLayoutHeight { get; set; } = 40;

    public IEnumerable<object> Items
    {
        get => (IEnumerable<object>)GetValue(ItemsProperty);
        set => SetValue(ItemsProperty, value);
    }

    public static readonly BindableProperty ItemsProperty =
        BindableProperty.Create(nameof(Items),
                                typeof(IEnumerable<object>),
                                typeof(PMSAutoSuggestBox),
                                null,
                                BindingMode.TwoWay,
                                propertyChanged: OnItemsChanged);
    private static void OnItemsChanged(BindableObject bindable, object oldValue, object newValue)
    {
        if (bindable is PMSAutoSuggestBox control && newValue is IEnumerable<object> newItems)
        {
            control.FilteredItems.Clear();
            //foreach (var item in newItems)
            //{
            //    control.FilteredItems.Add(item);
            //}
        }
    }

    public string DisplayColumn
    {
        get => (string)GetValue(DisplayColumnProperty);
        set => SetValue(DisplayColumnProperty, value);
    }
    public static readonly BindableProperty DisplayColumnProperty =
        BindableProperty.Create(nameof(DisplayColumn),
                                typeof(string),
                                typeof(PMSAutoSuggestBox),
                                "",
                                BindingMode.TwoWay);

    public ObservableCollection<object> FilteredItems { get; set; } = new();

    public PMSAutoSuggestBox()
	{
		InitializeComponent();
//#if ANDROID
//        absLayout.HeightRequest = 200;
//        //absLayout.WidthRequest = 350;
//#endif
    }

    public object SelectedItem
    {
        get => GetValue(SelectedItemProperty);
        set => SetValue(SelectedItemProperty, value);
    }
    public static readonly BindableProperty SelectedItemProperty =
        BindableProperty.Create(nameof(SelectedItem), typeof(object), typeof(PMSAutoSuggestBox), null, BindingMode.TwoWay,
            propertyChanged: OnSelectedItemChanged);
    private static void OnSelectedItemChanged(BindableObject bindable, object oldValue, object newValue)
    {
        var control = (PMSAutoSuggestBox)bindable;
        control.FilteredItems.Clear();

        control.SelectedItem = string.IsNullOrEmpty(control.SearchText) ? null : newValue;
        control.IsDropDownOpen = !string.IsNullOrEmpty(control.SearchText) && newValue == null;

        control.SearchText = newValue?.GetType()?.GetProperty(control.DisplayColumn)?.GetValue(newValue)?.ToString() ?? "";
    }

    public string SearchText
    {
        get => (string)GetValue(SearchTextProperty);
        set => SetValue(SearchTextProperty, value);
    }
    public static readonly BindableProperty SearchTextProperty =
        BindableProperty.Create(nameof(SearchText), 
                                typeof(string), 
                                typeof(PMSAutoSuggestBox), 
                                string.Empty, 
                                BindingMode.TwoWay,
                                propertyChanged: OnSearchTextChanged);
    private static void OnSearchTextChanged(BindableObject bindable, object oldValue, object newValue)
    {
        var control = (PMSAutoSuggestBox)bindable;
        control.SelectedItem = string.IsNullOrEmpty(newValue?.ToString()) ? null : control.SelectedItem;
        control.IsDropDownOpen = !string.IsNullOrEmpty(newValue as string) && control.SelectedItem == null;
        control.FilterItems();
#if ANDROID
            if (control.FilteredItems.Any())
            {
                control.absLayout.HeightRequest = 200;
            }
            else
            {
                control.absLayout.HeightRequest = 40;
            }
#endif
    }
    private void FilterItems()
    {
        FilteredItems.Clear();
        if (IsDropDownOpen)
        {
            if (string.IsNullOrWhiteSpace(SearchText))
            {
                foreach (var item in Items)
                    FilteredItems.Add(item);
            }
            else
            {
                foreach (var item in Items)
                {
                    var property = item.GetType()?.GetProperty(DisplayColumn)?.GetValue(item)?.ToString() ?? "";
                    if (property.Contains(SearchText,StringComparison.OrdinalIgnoreCase))
                    {
                        FilteredItems.Add(item);
                    }
                }   
            }
        }

    }
}