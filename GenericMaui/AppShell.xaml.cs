using GenericMaui.MVVM.Models;
using GenericMaui.Sql;

namespace GenericMaui
{
    public partial class AppShell : Shell
    {
        public AppShell(SqlContext _db)
        {
            InitializeComponent();

            foreach (var item in _db.Get(new SystemScreen())
                .Where(p => p.Code != "LoginPage" && p.IsAvailableOnMobile).OrderBy(p => p.PresentationSequence))
            {
                var obj = "GenericMaui.MVVM.Views.ApplicationManagemant." + item.Code;
                var objectType = Type.GetType(obj);

                if (objectType != null)
                {
                    this.Items.Add(new FlyoutItem()
                    {
                        Title = item.Name,
                        Items =
                        {
                            new ShellContent()
                            {
                                Title = item.Name,
                                ContentTemplate = new DataTemplate(objectType),
                                Route = item.Code
                            }
                        }
                    });
                }
            }
        }
    }
}
