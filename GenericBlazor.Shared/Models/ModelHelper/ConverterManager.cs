using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Jpeg;
using SixLabors.ImageSharp.Processing;
using System.Collections;


namespace GenericBlazor.Shared.Models.ModelHelper
{
    public static class ConverterManager
    {
		public static byte[] ResizeImage(byte[] archiveBytes, int maxWidth, int maxHeight)
		{
			try
			{
				using (var originalMs = new MemoryStream(archiveBytes))
				{
					using (var image = SixLabors.ImageSharp.Image.Load(originalMs))
					{
						// Redimensionar a imagem
						image.Mutate(x => x.Resize(new SixLabors.ImageSharp.Size(maxWidth, maxHeight)));

						// Inicializar variáveis para compressão
						byte[] resultBytes = null;
						int quality = 75;
						int minQuality = 0;
						int maxQuality = 100;

						using (var resizedMs = new MemoryStream())
						{
							while (resizedMs.Length > 3000 && minQuality <= maxQuality)
							{ 
								resizedMs.SetLength(0); // Limpa o MemoryStream para reescrever a imagem
								var encoder = new JpegEncoder { Quality = quality };
								image.Save(resizedMs, encoder);

								if ( resizedMs.Length <= 3000)
								{
									resultBytes = resizedMs.ToArray();
									maxQuality = quality - 1;
								}
								else
								{
									minQuality = quality + 1;
								}

								// Ajustar a qualidade usando busca binária
								quality = (minQuality + maxQuality) / 2;

							} 

							if (resultBytes == null)
							{
								throw new Exception("Não foi possível reduzir a imagem abaixo de 3000 bytes mantendo a qualidade aceitável.");
							}

							return resultBytes;
						}
					}
				}
			}
			catch (Exception ex)
			{
				throw new Exception("Erro ao redimensionar a imagem", ex);
			}
		}
	}
}
