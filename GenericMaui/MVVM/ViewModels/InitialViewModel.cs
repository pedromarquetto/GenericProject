using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GenericMaui.Helper;
using GenericMaui.Helper.Enums;
using GenericMaui.MVVM.Models;
using GenericMaui.MVVM.Views.ApplicationManagemant;
using GenericMaui.Sql;
using System.Collections.ObjectModel;

namespace GenericMaui.MVVM.ViewModels
{
    public partial class InitialViewModel : ObservableObject
    {
        private SqlContext _db;
        public InitialViewModel(SqlContext sqlContext)
        {
            _db = sqlContext;
            RunProgress();
            LoadData();
        }

        [ObservableProperty]
        public decimal progressCounter = 0;
        public async void LoadData()
        {
            await Task.Delay(3000);

            await Task.Run( () =>
            {
                LoginStateEnum fconfig = LoginStateEnum.NotConfigured;
                Users user = new Users();

                (fconfig, user) = FirstConfiguration.CheckFirstConfig();

                Page mainPage;

                if (fconfig == LoginStateEnum.UserLogged) // 1 first time // 2 not singed
                {
                    mainPage = new AppShell();
                }
                else if (fconfig == LoginStateEnum.UserNotLogged)
                {
                    mainPage = new LoginPage();
                }
                else
                {
                    mainPage = new LoginPage(); // To add error page
                }

                if (CompanyManager.CompanyConfig != null)
                {
                    Application.Current.Resources["PrimaryColorPMS"] = CompanyManager.CompanyConfig.HeaderColor;
                    Application.Current.Resources["TerciaryColorPMS"] = CompanyManager.CompanyConfig.FooterColor;
                    Application.Current.Resources["TextColorPMS"] = CompanyManager.CompanyConfig.FontColor;
                }

                MainThread.BeginInvokeOnMainThread(() =>
                {
                    Application.Current.Windows[0].Page = mainPage;
                    CompanyManager.IsAppLoaded = true;
                });

            });
        }
        public async void RunProgress()
        {
            while (ProgressCounter < 100)
            {
                await Task.Delay(150);
                ProgressCounter += Convert.ToDecimal(0.1);
            }
        }

    }
}
