using GenericBlazor.Shared.Models;
using GenericBlazor.Shared.Models.ModelHelper;
using GenericBlazor.Shared.Validator;
using GenericBlazor.Shared.WebServiceHelper;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
var builder = WebAssemblyHostBuilder.CreateDefault(args);

builder.Services.AddScoped(sp =>
	new HttpClient
	{
		BaseAddress = new Uri(builder.HostEnvironment.BaseAddress)
	});

builder.Services.AddScoped<WebServiceConnection>();
builder.Services.AddScoped<ValidatorHelper>();
builder.Services.AddSingleton<ICompanyManager, CompanyManager>();
builder.Services.AddSingleton<IUserManager, UserManager>();

await builder.Build().RunAsync();
