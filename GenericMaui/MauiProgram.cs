
using GenericMaui.Helper;
using GenericMaui.Interfaces;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.ViewModels;
using GenericMaui.MVVM.Views;
using GenericMaui.MVVM.Views.ApplicationManagemant;
using GenericMaui.Sql;
using Microsoft.Extensions.Logging;
using Org.BouncyCastle.Tls;
using System.Threading.Tasks;

namespace GenericMaui
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddSingleton<SqlContext>();

            //ViewModelDeclaration
            builder.Services.AddSingleton<MainPageViewModel>();
            builder.Services.AddSingleton<DbManagemantViewModel>();
            builder.Services.AddSingleton<LoginViewModel>();

            //Link View Model to view
            builder.Services.LinkViewWithViewModel<MainPage, MainPageViewModel>();
            builder.Services.LinkViewWithViewModel<DbManagementPage, DbManagemantViewModel>();
            builder.Services.LinkViewWithViewModel<LoginPage, LoginViewModel>();


#if DEBUG
            builder.Logging.AddDebug();
#endif
            SetCompanyConfiguration();

            return builder.Build();
        }

        public static void LinkViewWithViewModel<TView, TViewModel>(this IServiceCollection services)
            where TView : ContentPage, new()
        {
            services.AddSingleton<TView>(serviceProvider => new TView()
            {
                BindingContext = serviceProvider.GetRequiredService<TViewModel>()
            });
        }
        public static async void SetCompanyConfiguration()
        {
            await CompanyManager.SetCompanyConfiguration(new CompanyConfiguration());
        }
    }
}
