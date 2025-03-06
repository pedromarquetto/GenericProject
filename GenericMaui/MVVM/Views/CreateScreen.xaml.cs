using Microsoft.Maui.Controls.Shapes;
using Microsoft.Maui.Layouts;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace GenericMaui.MVVM.Views;

public partial class CreateScreen : ContentPage
{
    View draggedElement;
    View selectedElement;
    public List<string> addedIds = new List<string>();
    public List<View> addedViews = new List<View>();
    double xOffset = 0, yOffset = 0;

    StringBuilder srtNewScreen = new StringBuilder();
    StringBuilder srtNewScreenCS = new StringBuilder();

    public int _widReq;
    public int _heiReq;
    public CreateScreen()
	{
		InitializeComponent();

        var list = new List<string>();

        list.Add("Grid");
        list.Add("Absolute");

        screentype.ItemsSource = list;
    }

    private void OnDropMoveElement(object sender, DropEventArgs e)
    {
        if (e.Data.Properties.TryGetValue("DraggedElement", out var draggedElementObj) && draggedElementObj is View draggedElement)
        {
            var position = e.GetPosition(canvas);

            if (position != null)
            {
                AbsoluteLayout.SetLayoutBounds(draggedElement, new Rect(position.Value.X - draggedElement.WidthRequest / 2, position.Value.Y - draggedElement.HeightRequest / 2, draggedElement.WidthRequest, draggedElement.HeightRequest));
            }
        }
    }
    private void OnDragStarting(object sender, DragStartingEventArgs e)
    {

        var a = (DragGestureRecognizer)sender;
        if (addedIds?.Count() > 0 && addedIds.Any(p => p.Contains(a.Parent.Id.ToString())))
        {
            draggedElement = addedViews.FirstOrDefault(p => p.Id.ToString() == a.Parent.Id.ToString());
            e.Data.Properties.Add("DraggedElement", draggedElement);
            
        }
        else if (a.Parent is Label label)
        {
            e.Data.Properties.Add("ItemType", label.Text);
        }
        else if (a.Parent is Button button)
        {
            e.Data.Properties.Add("ItemType", button.Text);
        }
        else if (a.Parent is Entry entry)
        {
            e.Data.Properties.Add("ItemType", "Entry"); // Use a string identifier for Entry
        }
    }

    public void CreateFiles()
    {
        var path = System.IO.Path.Combine("C:\\Users\\plcm9\\source\\repos\\GenericMaui\\MVVM\\Views", $"{txtScreenName.Text}.xaml");
        var pathCS = System.IO.Path.Combine("C:\\Users\\plcm9\\source\\repos\\GenericMaui\\MVVM\\Views", $"{txtScreenName.Text}.xaml.cs");
        try
        {
            File.WriteAllText(path, srtNewScreen.ToString());
            File.WriteAllText(pathCS, srtNewScreenCS.ToString());
        }
        catch (Exception e)
        {

            throw;
        }
    }
    private void OnDrop(object sender, DropEventArgs e)
    {
        var isEdit = e.Data.Properties.TryGetValue("DraggedElement", out var draggedElementObj) && draggedElementObj is View;
        // Verifica se é um novo elemento ou um já existente sendo movido
        if (e.Data.Properties.TryGetValue("ItemType", out var itemType) && !isEdit)
        {
            // Novo elemento sendo adicionado
            View novoElemento = null;

            var strElement = "";

            switch (itemType)
            {
                case "TextBox":
                    var border = new Border { Stroke = Colors.Black, StrokeThickness = 2 };
                    var entry = new Entry { Placeholder = "Novo TextBox", WidthRequest = _widReq, HeightRequest = _heiReq, IsEnabled = false, IsReadOnly = true };
                    border.Content = entry;
                    novoElemento = border;

                    strElement = "\r\n<Entry \r\n" +
                                     "  Placeholder=\"Testing new Entry\" \r\n";
                                     
                    break;

                case "Button":
                    var border2 = new Border { Stroke = Colors.Black, StrokeThickness = 2 };
                    var btn = new Button { Text = "Novo Botão", WidthRequest = _widReq, HeightRequest = _heiReq };
                    border2.Content = btn;
                    novoElemento = border2;
                    break;
                case "Label":
                    var border3 = new Border { Stroke = Colors.Black, StrokeThickness = 2 };
                    var lbl = new Label { Text = "Novo Label", WidthRequest = _widReq, HeightRequest = _heiReq };
                    border3.Content = lbl;
                    novoElemento = border3;
                    break;
                case "Rectangle":
                    var rec = new Border { WidthRequest = _widReq, HeightRequest = _heiReq };
                    novoElemento = rec;
                    break;
            }

            if (novoElemento != null)
            {
                draggedElement = novoElemento;

                var dragGestureRecognizer = new DragGestureRecognizer();
                dragGestureRecognizer.DragStarting += (s, args) => OnDragStarting(s, args);

                var rightClickRecognizer = new TapGestureRecognizer
                {
                    Buttons = ButtonsMask.Secondary // Botão direito do mouse
                };
                rightClickRecognizer.Tapped += (s, args) => OnRightClick(s, args);

                var pointerRecognizer = new PointerGestureRecognizer();
                pointerRecognizer.PointerEntered += (s, args) => OnPointerEntered(s, args);
                pointerRecognizer.PointerExited += (s, args) => OnPointerExited(s, args);

                novoElemento.GestureRecognizers.Add(dragGestureRecognizer);
                novoElemento.GestureRecognizers.Add(rightClickRecognizer);
                novoElemento.GestureRecognizers.Add(pointerRecognizer);

                var position = e.GetPosition(canvas);
                if (position != null)
                {

                    int rowNo = Convert.ToInt32(position.Value.Y) / Convert.ToInt32(canvas.Bounds.Height / Convert.ToInt32(gridRows.Text));
                    int columnNo = Convert.ToInt32(position.Value.X) / Convert.ToInt32(canvas.Bounds.Width / Convert.ToInt32(gridColumn.Text));

                    strElement = strElement + 
                                    $"  Grid.Row=\"{rowNo.ToString()}\" \r\n" +
                                    $"  Grid.Column=\"{columnNo.ToString()}\" \r\n" +
                                    "/>\r\n";

                    srtNewScreen.Append(strElement);

                    AbsoluteLayout.SetLayoutBounds(novoElemento, new Rect(position.Value.X - novoElemento.WidthRequest / 2, position.Value.Y - novoElemento.HeightRequest / 2, novoElemento.WidthRequest, novoElemento.HeightRequest));
                    AbsoluteLayout.SetLayoutFlags(novoElemento, AbsoluteLayoutFlags.None);
                    canvas.Children.Add(novoElemento);
                    addedIds.Add(novoElemento.Id.ToString());
                    addedViews.Add(novoElemento);
                    draggedElement = null;
                }
            }
        }
        else if (isEdit)
        {
            // Elemento existente sendo movido
            var position = e.GetPosition(canvas);
            if (position != null)
            {
                AbsoluteLayout.SetLayoutBounds(draggedElement, new Rect(position.Value.X - draggedElement.WidthRequest / 2, position.Value.Y - draggedElement.HeightRequest / 2, draggedElement.WidthRequest, draggedElement.HeightRequest));
                draggedElement = null;
            }
        }
        var a = SerializePage(this);
    }
    public string SerializePage(Page page)
    {
        var stringBuilder = new StringBuilder();
        var xmlWriterSettings = new XmlWriterSettings
        {
            Indent = true,
            OmitXmlDeclaration = false,
            Encoding = System.Text.Encoding.UTF8
        };

        using (var writer = XmlWriter.Create(stringBuilder, xmlWriterSettings))
        {
            var xmlSerializer = new XmlSerializer(typeof(Page));
            xmlSerializer.Serialize(writer, page);
        }

        return stringBuilder.ToString();
    }
    private void OnRightClick(object sender, EventArgs e)
    {
        var view = selectedElement = sender as View;

        // Posição onde foi clicado
        var position = AbsoluteLayout.GetLayoutBounds(view);

        AbsoluteLayout.SetLayoutBounds(ContextMenu, new Rect(position.X + position.X, position.Y, ContextMenu.Width, ContextMenu.Height));
        ContextMenu.IsVisible = true;
    }
    private void OnDeleteClicked(object sender, EventArgs e)
    {
        // Lógica para deletar o componente
        canvas.Children.Remove(selectedElement);
        ContextMenu.IsVisible = false;
        selectedElement = null;
    }

    // Evento ao clicar no botão "Edit"
    private void OnEditClicked(object sender, EventArgs e)
    {
        // Lógica para editar o componente
        DisplayAlert("Action", "Edit clicked", "OK");
        ContextMenu.IsVisible = false;
    }
    private void OnPointerEntered(object sender, PointerEventArgs e)
    {
        if (sender is Border border)
        {
            // Aumentar a borda
            border.StrokeThickness = 4;
            // Adicionar/alterar a sombra
            border.Shadow = new Shadow
            {
                Brush = Colors.Red,
                Offset = new Microsoft.Maui.Graphics.Point(0,4),
                Radius = 8
            };
        }
    }

    private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
    {
        slPropertyPanel.IsVisible = true;
    }

    private void Button_Clicked(object sender, EventArgs e)
    {
        _heiReq = Convert.ToInt32(slPropertyPanelHeighReq.Text);
        _widReq = Convert.ToInt32(slPropertyPanelWidthReq.Text);
        slPropertyPanel.IsVisible = false;
    }

    private void txtScreenName_Unfocused(object sender, FocusEventArgs e)
    {
        if (!string.IsNullOrEmpty(txtScreenName.Text))
        {
            var str = "<ContentPage xmlns=\"http://schemas.microsoft.com/dotnet/2021/maui\"\r\n             " +
                      "xmlns:x=\"http://schemas.microsoft.com/winfx/2009/xaml\"\r\n             " +
                      $"x:Class=\"GenericMaui.MVVM.Views.{txtScreenName.Text}\"\r\n             " +
                      "xmlns:custom=\"clr-namespace:GenericMaui.MVVM.Views.CustomComponents\"\r\n             " +
                      $"Title=\"{txtScreenName.Text}\">\r\n" +
                      "<Grid>\r\n";

            var strCS = "using GenericMaui.Helper;\r\n" +
                        "using GenericMaui.MVVM.Models;\r\n" +
                        "using GenericMaui.Sql;\r\n" +
                        "using System.Collections.ObjectModel;\r\n\r\n" +
                        "namespace GenericMaui.MVVM.Views;\r\n\r\n" +
                        $"public partial class {txtScreenName.Text} : ContentPage\r\n" +
                        "{\r\n" +
                            $"public {txtScreenName.Text}()\r\n    " +
                            "{\r\n" +
                            "InitializeComponent();\r\n" +
                            "}\r\n" +
                        "}\r\n";

            str.Replace("replace1", txtScreenName.Text);

            strCS.Replace("{0}", txtScreenName.Text);

            srtNewScreen.Append(str);
            srtNewScreenCS.Append(strCS);
        }
    }

    private void Button_Clicked_1(object sender, EventArgs e)
    {
        var str = $"\r\n</Grid>\r\n" +
                   "</ContentPage>";

        srtNewScreen.Append(str);

        CreateFiles();
    }
    private void screentype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (screentype?.SelectedItem == "Grid")
        {
            Line line = new Line { WidthRequest = canvas.Bounds.Width, HeightRequest = canvas.Bounds.Height, Stroke = Colors.Black, StrokeThickness = 2, X2 = canvas.Bounds.Width };
            AbsoluteLayout.SetLayoutBounds(line, new Rect(0, canvas.Bounds.Height / 3, line.WidthRequest, line.HeightRequest));
            AbsoluteLayout.SetLayoutFlags(line, AbsoluteLayoutFlags.None);
            canvas.Children.Add(line);

            Line line2 = new Line { WidthRequest = canvas.Bounds.Width, HeightRequest = canvas.Bounds.Height, Stroke = Colors.Black, StrokeThickness = 2, X2 = canvas.Bounds.Width };
            AbsoluteLayout.SetLayoutBounds(line2, new Rect(0, (canvas.Bounds.Height / 3)*2, line2.WidthRequest, line2.HeightRequest));
            AbsoluteLayout.SetLayoutFlags(line2, AbsoluteLayoutFlags.None);
            canvas.Children.Add(line2);

            Line line3 = new Line { WidthRequest = canvas.Bounds.Width, HeightRequest = canvas.Bounds.Height, Stroke = Colors.Black, StrokeThickness = 2, Y2 = canvas.Bounds.Height };
            AbsoluteLayout.SetLayoutBounds(line3, new Rect(canvas.Bounds.Width / 3, 0, line3.WidthRequest, line3.HeightRequest));
            AbsoluteLayout.SetLayoutFlags(line3, AbsoluteLayoutFlags.None);
            canvas.Children.Add(line3);

            Line line4 = new Line { WidthRequest = canvas.Bounds.Width, HeightRequest = canvas.Bounds.Height, Stroke = Colors.Black, StrokeThickness = 2, Y2 = canvas.Bounds.Height };
            AbsoluteLayout.SetLayoutBounds(line4, new Rect((canvas.Bounds.Width / 3)*2, 0, line4.WidthRequest, line4.HeightRequest));
            AbsoluteLayout.SetLayoutFlags(line4, AbsoluteLayoutFlags.None);
            canvas.Children.Add(line4);
        }
    }

    private void OnPointerExited(object sender, PointerEventArgs e)
    {
        if (sender is Border border)
        {
            // Restaurar a borda
            border.StrokeThickness = 2;
            // Restaurar a sombra
            border.Shadow = new Shadow
            {
                Brush = Colors.Grey,
                Offset = new Microsoft.Maui.Graphics.Point(0, 2),
                Radius = 4
            };
        }
    }
}