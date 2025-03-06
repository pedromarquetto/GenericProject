

using GenericBlazor.Client.Pages;
using GenericBlazor.Controller;
using GenericBlazor.General;
using GenericBlazor.Shared.Models;
using GenericBlazor.Shared.Models.ModelHelper;
using GenericBlazor.Shared.Validator;
using GenericBlazor.Shared.WebServiceHelper;
using Microsoft.AspNetCore.Hosting;


//declarating appsettings.json to MAIN configuration
IConfigurationRoot configuration = new ConfigurationBuilder()
    .SetBasePath(AppDomain.CurrentDomain.BaseDirectory).AddJsonFile("appsettings.json")
    .Build();

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddScoped(http => new HttpClient
{
    BaseAddress = new Uri(builder.Configuration.GetSection("BaseAdress").Value!)
});
// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents()
    .AddInteractiveWebAssemblyComponents();

builder.Services.AddScoped<WebServiceConnection>();
builder.Services.AddScoped<ValidatorHelper>();
builder.Services.AddSingleton<IUserManager, UserManager>();
builder.Services.AddSingleton<ICompanyManager, CompanyManager>();
builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

builder.Services.AddTransient<MainController>();

builder.Services.AddControllers();
builder.Services.AddHttpClient();
//builder.Services.AddSignalR();
//builder.Services.AddSingleton<CounterService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowOrigin",
        builder => builder.AllowAnyOrigin()
                          .AllowAnyHeader()
                          .AllowAnyMethod());
});



var app = builder.Build();

app.UseCors("AllowOrigin");
app.UseCookiePolicy();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

//using (var scope = app.Services.CreateScope())
//{
//    var services = scope.ServiceProvider;
//    var counterService = services.GetRequiredService<CounterService>(); // Isso garante que o serviço seja inicializado
//}


app.UseHttpsRedirection();
app.MapControllers();
app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode()
    .AddInteractiveWebAssemblyRenderMode()
    .AddAdditionalAssemblies(typeof(Counter).Assembly);

app.Run();
