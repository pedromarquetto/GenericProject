using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Views;
using GenericMaui.Sql;
using Microsoft.VisualStudio.Services.Common;

namespace GenericMaui
{
    public partial class AppShell : Shell
    {
        public AppShell(SqlContext _db)
        {
            InitializeComponent();

            //foreach (var item in _db.Get(new SystemScreen()))
            //{
            //    var obj = "GenericMaui.MVVM.Views.ApplicationManagemant." + item.Name+"Page";
            //    var objectType = Type.GetType(obj);

            //    if (objectType != null)
            //    {
            //        this.Items.Add(new FlyoutItem()
            //        {
            //            Title = item.Name,
            //            Items =
            //            {
            //                new ShellContent()
            //                {
            //                    ContentTemplate = new DataTemplate(objectType)
            //                }
            //            }
            //        });
            //    }
            //}
        }
    }
}
