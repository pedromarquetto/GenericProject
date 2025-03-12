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

            LoginStateEnum fconfig = LoginStateEnum.NotConfigured;
            Users user = new Users();

            (fconfig, user) = FirstConfiguration.CheckFirstConfig();

            Page mainPage;

            if (fconfig == LoginStateEnum.UserLogged)
            {
                mainPage = new AppShell(_db);
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
                var config = _db.Get(CompanyManager.CompanyConfig)?.First();

                await CompanyManager.SetCompanyConfiguration(config);

                Application.Current.Resources["PrimaryColorPMS"] = CompanyManager.CompanyConfig.HeaderColor;
                Application.Current.Resources["TerciaryColorPMS"] = CompanyManager.CompanyConfig.FooterColor;
                Application.Current.Resources["TextColorPMS"] = CompanyManager.CompanyConfig.FontColor;
            }

            Application.Current.Windows[0].Page = mainPage;
            CompanyManager.IsAppLoaded = true;           
        }
        public async void RunProgress()
        {
            await Task.Run(async () =>
            {
                while (ProgressCounter < 100)
                {
                    await Task.Delay(150);
                    MainThread.BeginInvokeOnMainThread(() =>
                    {
                        ProgressCounter += Convert.ToDecimal(0.1);
                    });
                }
            });
        }

    }
}
