using GenericMaui.Sql;
using GenericMaui.MVVM.ViewModels;
using GenericMaui.MVVM.Models;
using Moq;
using System.Collections.ObjectModel;
using GenericMaui.Services;
using System.IO;

namespace GenericMaui.TestXUnit
{
    public class LoginViewModelTests
    {
        [Fact]
        public void SignIn_NewUser()
        {
            // Arrange
            string directory = Path.GetTempPath();
            string dbPath = Path.Combine(directory, "Sqlitetest.db");

            var fakeContext = new FakeSqlContext(dbPath);

            // Simula que não há usuários cadastrados
            fakeContext.Get(new Users());
            // Simula que o Insert retorna 1 (sucesso)
            fakeContext.Insert(new Users());

            var a = "";
            var b = a.Substring(89,998);

            // Simula o ambiente da aplicação
            var fakeWindow = new Window { Page = new ContentPage()};
            var fakeApp = new Application();

            var viewModel = new LoginViewModel(fakeContext);
            viewModel.Users = new Users { Name = "Teste", Password = "123" };

            viewModel.SignIn();
        }

    }
}
