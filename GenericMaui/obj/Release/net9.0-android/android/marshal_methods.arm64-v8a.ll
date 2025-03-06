; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [223 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [669 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 149
	i64 u0x0071cf2d27b7d61e, ; 1: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 117
	i64 u0x01109b0e4d99e61f, ; 2: System.ComponentModel.Annotations.dll => 132
	i64 u0x02123411c4e01926, ; 3: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 113
	i64 u0x02abedc11addc1ed, ; 4: lib_Mono.Android.Runtime.dll.so => 221
	i64 u0x032267b2a94db371, ; 5: lib_Xamarin.AndroidX.AppCompat.dll.so => 96
	i64 u0x033a1d0324ba06bd, ; 6: Microsoft.IO.RecyclableMemoryStream.dll => 49
	i64 u0x03602360ed7b65c0, ; 7: lib_ExtendedNumerics.BigDecimal.dll.so => 38
	i64 u0x03621c804933a890, ; 8: System.Buffers => 127
	i64 u0x0363ac97a4cb84e6, ; 9: SQLitePCLRaw.provider.e_sqlite3.dll => 89
	i64 u0x0399610510a38a38, ; 10: lib_System.Private.DataContractSerialization.dll.so => 171
	i64 u0x043032f1d071fae0, ; 11: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 12: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 13: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 14: System.Net.Primitives => 163
	i64 u0x0565d18c6da3de38, ; 15: Xamarin.AndroidX.RecyclerView => 115
	i64 u0x0581db89237110e9, ; 16: lib_System.Collections.dll.so => 131
	i64 u0x05989cb940b225a9, ; 17: Microsoft.Maui.dll => 52
	i64 u0x05a1c25e78e22d87, ; 18: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 179
	i64 u0x06076b5d2b581f08, ; 19: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x06388ffe9f6c161a, ; 20: System.Xml.Linq.dll => 212
	i64 u0x0680a433c781bb3d, ; 21: Xamarin.AndroidX.Collection.Jvm => 99
	i64 u0x069fff96ec92a91d, ; 22: System.Xml.XPath.dll => 215
	i64 u0x07c57877c7ba78ad, ; 23: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 24: System.Collections.NonGeneric => 129
	i64 u0x0835c05f84ea5da4, ; 25: lib_Microsoft.TeamFoundation.WorkItemTracking.Process.WebApi.dll.so => 68
	i64 u0x08a7c865576bbde7, ; 26: System.Reflection.Primitives => 177
	i64 u0x08f3c9788ee2153c, ; 27: Xamarin.AndroidX.DrawerLayout => 104
	i64 u0x09138715c92dba90, ; 28: lib_System.ComponentModel.Annotations.dll.so => 132
	i64 u0x0919c28b89381a0b, ; 29: lib_Microsoft.Extensions.Options.dll.so => 47
	i64 u0x092266563089ae3e, ; 30: lib_System.Collections.NonGeneric.dll.so => 129
	i64 u0x09d144a7e214d457, ; 31: System.Security.Cryptography => 195
	i64 u0x0a980941fa112bc4, ; 32: System.Security.Cryptography.Xml => 94
	i64 u0x0abb3e2b271edc45, ; 33: System.Threading.Channels.dll => 203
	i64 u0x0b3b632c3bbee20c, ; 34: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 35: Xamarin.KotlinX.Serialization.Core.Jvm => 123
	i64 u0x0be2e1f8ce4064ed, ; 36: Xamarin.AndroidX.ViewPager => 118
	i64 u0x0c3ca6cc978e2aae, ; 37: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c537dededac91bc, ; 38: lib_Microsoft.Azure.DevOps.Comments.WebApi.dll.so => 57
	i64 u0x0c59ad9fbbd43abe, ; 39: Mono.Android => 222
	i64 u0x0c7790f60165fc06, ; 40: lib_Microsoft.Maui.Essentials.dll.so => 53
	i64 u0x0d12c8129f7dc6cf, ; 41: Microsoft.TeamFoundation.Wiki.WebApi.dll => 66
	i64 u0x0e14e73a54dda68e, ; 42: lib_System.Net.NameResolution.dll.so => 161
	i64 u0x0e6201d36109e73b, ; 43: Microsoft.TeamFoundation.DistributedTask.Common.Contracts.dll => 55
	i64 u0x0e847ae86f236751, ; 44: lib_NPOI.OpenXml4Net.dll.so => 79
	i64 u0x0e8481969601918b, ; 45: ICSharpCode.SharpZipLib.dll => 81
	i64 u0x102a31b45304b1da, ; 46: Xamarin.AndroidX.CustomView => 103
	i64 u0x10f6cfcbcf801616, ; 47: System.IO.Compression.Brotli => 150
	i64 u0x114443cdcf2091f1, ; 48: System.Security.Cryptography.Primitives => 193
	i64 u0x123639456fb056da, ; 49: System.Reflection.Emit.Lightweight.dll => 176
	i64 u0x125b7f94acb989db, ; 50: Xamarin.AndroidX.RecyclerView.dll => 115
	i64 u0x12e6ac3eb4ac01d6, ; 51: MS.TF.Pipelines.WebApi.NetStandard => 56
	i64 u0x13a01de0cbc3f06c, ; 52: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 53: lib_Java.Interop.dll.so => 220
	i64 u0x13f1e880c25d96d1, ; 54: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 55: Microsoft.Extensions.DependencyInjection.Abstractions => 44
	i64 u0x152a448bd1e745a7, ; 56: Microsoft.Win32.Primitives => 126
	i64 u0x15bdc156ed462f2f, ; 57: lib_System.IO.FileSystem.dll.so => 153
	i64 u0x16bf2a22df043a09, ; 58: System.IO.Pipes.dll => 155
	i64 u0x16ea2b318ad2d830, ; 59: System.Security.Cryptography.Algorithms => 190
	i64 u0x17125c9a85b4929f, ; 60: lib_netstandard.dll.so => 218
	i64 u0x17b56e25558a5d36, ; 61: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 62: System.Text.Encodings.Web => 200
	i64 u0x18402a709e357f3b, ; 63: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 123
	i64 u0x18a9befae51bb361, ; 64: System.Net.WebClient => 167
	i64 u0x18f0ce884e87d89a, ; 65: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x19a4c090f14ebb66, ; 66: System.Security.Claims => 189
	i64 u0x1a91866a319e9259, ; 67: lib_System.Collections.Concurrent.dll.so => 128
	i64 u0x1aac34d1917ba5d3, ; 68: lib_System.dll.so => 217
	i64 u0x1aad60783ffa3e5b, ; 69: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1bf2a5b665ffb0bf, ; 70: Microsoft.TeamFoundation.Work.WebApi => 67
	i64 u0x1c4e0224752e10d0, ; 71: lib_Microsoft.Azure.Pipelines.WebApi.dll.so => 58
	i64 u0x1c753b5ff15bce1b, ; 72: Mono.Android.Runtime.dll => 221
	i64 u0x1cd47467799d8250, ; 73: System.Threading.Tasks.dll => 205
	i64 u0x1e3d87657e9659bc, ; 74: Xamarin.AndroidX.Navigation.UI => 114
	i64 u0x1e71143913d56c10, ; 75: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1e7c31185e2fb266, ; 76: lib_System.Threading.Tasks.Parallel.dll.so => 204
	i64 u0x1ed8fcce5e9b50a0, ; 77: Microsoft.Extensions.Options.dll => 47
	i64 u0x1f055d15d807e1b2, ; 78: System.Xml.XmlSerializer => 216
	i64 u0x1f1db6c2c9fa7fcd, ; 79: Microsoft.TeamFoundation.Build2.WebApi => 59
	i64 u0x20237ea48006d7a8, ; 80: lib_System.Net.WebClient.dll.so => 167
	i64 u0x205f12e5ad0b1db8, ; 81: ExtendedNumerics.BigDecimal => 38
	i64 u0x209375905fcc1bad, ; 82: lib_System.IO.Compression.Brotli.dll.so => 150
	i64 u0x20fab3cf2dfbc8df, ; 83: lib_System.Diagnostics.Process.dll.so => 141
	i64 u0x2110167c128cba15, ; 84: System.Globalization => 149
	i64 u0x2174319c0d835bc9, ; 85: System.Runtime => 188
	i64 u0x21cc7e445dcd5469, ; 86: System.Reflection.Emit.ILGeneration => 175
	i64 u0x220fd4f2e7c48170, ; 87: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x224538d85ed15a82, ; 88: System.IO.Pipes => 155
	i64 u0x22908438c6bed1af, ; 89: lib_System.Threading.Timer.dll.so => 208
	i64 u0x237be844f1f812c7, ; 90: System.Threading.Thread.dll => 206
	i64 u0x23852b3bdc9f7096, ; 91: System.Resources.ResourceManager => 178
	i64 u0x2407aef2bbe8fadf, ; 92: System.Console => 137
	i64 u0x240abe014b27e7d3, ; 93: Xamarin.AndroidX.Core.dll => 101
	i64 u0x2420945b67c507aa, ; 94: Microsoft.Azure.Pipelines.WebApi => 58
	i64 u0x247619fe4413f8bf, ; 95: System.Runtime.Serialization.Primitives.dll => 187
	i64 u0x252073cc3caa62c2, ; 96: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x25a0a7eff76ea08e, ; 97: SQLitePCLRaw.batteries_v2.dll => 85
	i64 u0x2662c629b96b0b30, ; 98: lib_Xamarin.Kotlin.StdLib.dll.so => 121
	i64 u0x268c1439f13bcc29, ; 99: lib_Microsoft.Extensions.Primitives.dll.so => 48
	i64 u0x26d077d9678fe34f, ; 100: System.IO.dll => 156
	i64 u0x273f3515de5faf0d, ; 101: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 102: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x27b410442fad6cf1, ; 103: Java.Interop.dll => 220
	i64 u0x27b97e0d52c3034a, ; 104: System.Diagnostics.Debug => 139
	i64 u0x2801845a2c71fbfb, ; 105: System.Net.Primitives.dll => 163
	i64 u0x2a128783efe70ba0, ; 106: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 107: lib_System.Net.NetworkInformation.dll.so => 162
	i64 u0x2a6507a5ffabdf28, ; 108: System.Diagnostics.TraceSource.dll => 144
	i64 u0x2ad156c8e1354139, ; 109: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 110: System.Text.RegularExpressions.dll => 202
	i64 u0x2afc1c4f898552ee, ; 111: lib_System.Formats.Asn1.dll.so => 148
	i64 u0x2b148910ed40fbf9, ; 112: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2bc2c8499f169046, ; 113: SixLabors.ImageSharp => 83
	i64 u0x2c8bd14bb93a7d82, ; 114: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2cbd9262ca785540, ; 115: lib_System.Text.Encoding.CodePages.dll.so => 197
	i64 u0x2cc9e1fed6257257, ; 116: lib_System.Reflection.Emit.Lightweight.dll.so => 176
	i64 u0x2cd723e9fe623c7c, ; 117: lib_System.Private.Xml.Linq.dll.so => 173
	i64 u0x2d169d318a968379, ; 118: System.Threading.dll => 209
	i64 u0x2d47774b7d993f59, ; 119: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2d9c22e6e269f657, ; 120: lib_Microsoft.VisualStudio.Services.Common.dll.so => 73
	i64 u0x2db915caf23548d2, ; 121: System.Text.Json.dll => 201
	i64 u0x2dc0101b251f3d48, ; 122: Microsoft.VisualStudio.Services.WebApi.dll => 74
	i64 u0x2e5a40c319acb800, ; 123: System.IO.FileSystem => 153
	i64 u0x2e6f1f226821322a, ; 124: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f02f94df3200fe5, ; 125: System.Diagnostics.Process => 141
	i64 u0x2f2e98e1c89b1aff, ; 126: System.Xml.ReaderWriter => 213
	i64 u0x2f5911d9ba814e4e, ; 127: System.Diagnostics.Tracing => 145
	i64 u0x309ee9eeec09a71e, ; 128: lib_Xamarin.AndroidX.Fragment.dll.so => 105
	i64 u0x31195fef5d8fb552, ; 129: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x31be47543be3ce1f, ; 130: lib_Microsoft.VisualStudio.Services.TestManagement.TestPlanning.WebApi.dll.so => 70
	i64 u0x32243413e774362a, ; 131: Xamarin.AndroidX.CardView.dll => 98
	i64 u0x3235427f8d12dae1, ; 132: lib_System.Drawing.Primitives.dll.so => 146
	i64 u0x329753a17a517811, ; 133: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 134: lib_System.Xml.ReaderWriter.dll.so => 213
	i64 u0x3375ce28502b434e, ; 135: NPOI.Core.dll => 77
	i64 u0x33a31443733849fe, ; 136: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 137: lib_System.Net.Sockets.dll.so => 166
	i64 u0x34dfd74fe2afcf37, ; 138: Microsoft.Maui => 52
	i64 u0x34e292762d9615df, ; 139: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 140: Microsoft.Maui.Controls => 50
	i64 u0x353590da528c9d22, ; 141: System.ComponentModel.Annotations => 132
	i64 u0x3549870798b4cd30, ; 142: lib_Xamarin.AndroidX.ViewPager2.dll.so => 119
	i64 u0x355282fc1c909694, ; 143: Microsoft.Extensions.Configuration => 41
	i64 u0x355c649948d55d97, ; 144: lib_System.Runtime.Intrinsics.dll.so => 183
	i64 u0x359882f8387518bd, ; 145: Microsoft.VisualStudio.Services.TestManagement.TestPlanning.WebApi.dll => 70
	i64 u0x3628ab68db23a01a, ; 146: lib_System.Diagnostics.Tools.dll.so => 143
	i64 u0x3673b042508f5b6b, ; 147: lib_System.Runtime.Extensions.dll.so => 180
	i64 u0x36b2b50fdf589ae2, ; 148: System.Reflection.Emit.Lightweight => 176
	i64 u0x374ef46b06791af6, ; 149: System.Reflection.Primitives.dll => 177
	i64 u0x37bc29f3183003b6, ; 150: lib_System.IO.dll.so => 156
	i64 u0x38049b5c59b39324, ; 151: System.Runtime.CompilerServices.Unsafe => 179
	i64 u0x385c17636bb6fe6e, ; 152: Xamarin.AndroidX.CustomView.dll => 103
	i64 u0x38869c811d74050e, ; 153: System.Net.NameResolution.dll => 161
	i64 u0x39251dccb84bdcaa, ; 154: lib_System.Configuration.ConfigurationManager.dll.so => 91
	i64 u0x393c226616977fdb, ; 155: lib_Xamarin.AndroidX.ViewPager.dll.so => 118
	i64 u0x395e37c3334cf82a, ; 156: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x39aa39fda111d9d3, ; 157: Newtonsoft.Json => 75
	i64 u0x3a6cc111856de066, ; 158: Microsoft.VisualStudio.Services.Common => 73
	i64 u0x3aacf90d24604f9d, ; 159: SQLitePCLRaw.provider.sqlite3.dll => 90
	i64 u0x3ab5859054645f72, ; 160: System.Security.Cryptography.Primitives.dll => 193
	i64 u0x3b6894af158dd739, ; 161: System.Net.Http.Formatting => 40
	i64 u0x3b860f9932505633, ; 162: lib_System.Text.Encoding.Extensions.dll.so => 198
	i64 u0x3c3aafb6b3a00bf6, ; 163: lib_System.Security.Cryptography.X509Certificates.dll.so => 194
	i64 u0x3c7c495f58ac5ee9, ; 164: Xamarin.Kotlin.StdLib => 121
	i64 u0x3d196e782ed8c01a, ; 165: System.Data.SqlClient => 92
	i64 u0x3d2b1913edfc08d7, ; 166: lib_System.Threading.ThreadPool.dll.so => 207
	i64 u0x3d46f0b995082740, ; 167: System.Xml.Linq => 212
	i64 u0x3d9c2a242b040a50, ; 168: lib_Xamarin.AndroidX.Core.dll.so => 101
	i64 u0x3da7781d6333a8fe, ; 169: SQLitePCLRaw.batteries_v2 => 85
	i64 u0x3fc2b7b87a164cbc, ; 170: Microsoft.TeamFoundation.DistributedTask.Common.Contracts => 55
	i64 u0x407a10bb4bf95829, ; 171: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 111
	i64 u0x415e36f6b13ff6f3, ; 172: System.Configuration.ConfigurationManager.dll => 91
	i64 u0x41cab042be111c34, ; 173: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 97
	i64 u0x41f96d72dd6b57de, ; 174: Microsoft.TeamFoundation.Policy.WebApi.dll => 62
	i64 u0x423a9ecc4d905a88, ; 175: lib_System.Resources.ResourceManager.dll.so => 178
	i64 u0x423bf51ae7def810, ; 176: System.Xml.XPath => 215
	i64 u0x42761d41773a05db, ; 177: lib_NPOI.OOXML.dll.so => 78
	i64 u0x43375950ec7c1b6a, ; 178: netstandard.dll => 218
	i64 u0x434c4e1d9284cdae, ; 179: Mono.Android.dll => 222
	i64 u0x43950f84de7cc79a, ; 180: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x448bd33429269b19, ; 181: Microsoft.CSharp => 125
	i64 u0x4499fa3c8e494654, ; 182: lib_System.Runtime.Serialization.Primitives.dll.so => 187
	i64 u0x4515080865a951a5, ; 183: Xamarin.Kotlin.StdLib.dll => 121
	i64 u0x45c40276a42e283e, ; 184: System.Diagnostics.TraceSource => 144
	i64 u0x463d680a1dec0810, ; 185: System.Security.Cryptography.Xml.dll => 94
	i64 u0x46a4213bc97fe5ae, ; 186: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x472c10e45b4b6f81, ; 187: SixLabors.ImageSharp.dll => 83
	i64 u0x47358bd471172e1d, ; 188: lib_System.Xml.Linq.dll.so => 212
	i64 u0x47daf4e1afbada10, ; 189: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 190: System.ObjectModel => 170
	i64 u0x4a5667b2462a664b, ; 191: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 114
	i64 u0x4b07a0ed0ab33ff4, ; 192: System.Runtime.Extensions.dll => 180
	i64 u0x4b7b6532ded934b7, ; 193: System.Text.Json => 201
	i64 u0x4bb183a647a35f4e, ; 194: lib_Microsoft.TeamFoundation.Build2.WebApi.dll.so => 59
	i64 u0x4cc5f15266470798, ; 195: lib_Xamarin.AndroidX.Loader.dll.so => 110
	i64 u0x4cf6f67dc77aacd2, ; 196: System.Net.NetworkInformation.dll => 162
	i64 u0x4d479f968a05e504, ; 197: System.Linq.Expressions.dll => 157
	i64 u0x4d55a010ffc4faff, ; 198: System.Private.Xml => 174
	i64 u0x4d95fccc1f67c7ca, ; 199: System.Runtime.Loader.dll => 184
	i64 u0x4dcf44c3c9b076a2, ; 200: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 201: Xamarin.AndroidX.Loader.dll => 110
	i64 u0x4e32f00cb0937401, ; 202: Mono.Android.Runtime => 221
	i64 u0x4e5eea4668ac2b18, ; 203: System.Text.Encoding.CodePages => 197
	i64 u0x4ebd0c4b82c5eefc, ; 204: lib_System.Threading.Channels.dll.so => 203
	i64 u0x4f21ee6ef9eb527e, ; 205: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x4fd5f3ee53d0a4f0, ; 206: SQLitePCLRaw.lib.e_sqlite3.android => 87
	i64 u0x4fdbea8683929d35, ; 207: Microsoft.TeamFoundation.WorkItemTracking.WebApi => 69
	i64 u0x5037f0be3c28c7a3, ; 208: lib_Microsoft.Maui.Controls.dll.so => 50
	i64 u0x5112ed116d87baf8, ; 209: CommunityToolkit.Mvvm => 36
	i64 u0x51165dc3c0e10163, ; 210: Microsoft.TeamFoundation.TestManagement.WebApi => 65
	i64 u0x5131bbe80989093f, ; 211: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 108
	i64 u0x51bb8a2afe774e32, ; 212: System.Drawing => 147
	i64 u0x526ce79eb8e90527, ; 213: lib_System.Net.Primitives.dll.so => 163
	i64 u0x52829f00b4467c38, ; 214: lib_System.Data.Common.dll.so => 138
	i64 u0x529ffe06f39ab8db, ; 215: Xamarin.AndroidX.Core => 101
	i64 u0x52d01bc91d6d5848, ; 216: lib_SQLitePCLRaw.provider.sqlite3.dll.so => 90
	i64 u0x52ff996554dbf352, ; 217: Microsoft.Maui.Graphics => 54
	i64 u0x535f7e40e8fef8af, ; 218: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53a96d5c86c9e194, ; 219: System.Net.NetworkInformation => 162
	i64 u0x53be1038a61e8d44, ; 220: System.Runtime.InteropServices.RuntimeInformation.dll => 181
	i64 u0x53c3014b9437e684, ; 221: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x541ce529de288d81, ; 222: Microsoft.Azure.Pipelines.WebApi.dll => 58
	i64 u0x5435e6f049e9bc37, ; 223: System.Security.Claims.dll => 189
	i64 u0x54795225dd1587af, ; 224: lib_System.Runtime.dll.so => 188
	i64 u0x55250ba592fd51e2, ; 225: SQLitePCLRaw.provider.dynamic_cdecl.dll => 88
	i64 u0x556e8b63b660ab8b, ; 226: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 106
	i64 u0x5588627c9a108ec9, ; 227: System.Collections.Specialized => 130
	i64 u0x55c27c746f550e7f, ; 228: lib_NPOI.OpenXmlFormats.dll.so => 80
	i64 u0x571c5cfbec5ae8e2, ; 229: System.Private.Uri => 172
	i64 u0x578cd35c91d7b347, ; 230: lib_SQLitePCLRaw.core.dll.so => 86
	i64 u0x579a06fed6eec900, ; 231: System.Private.CoreLib.dll => 219
	i64 u0x57c542c14049b66d, ; 232: System.Diagnostics.DiagnosticSource => 140
	i64 u0x57edc7adad611bc0, ; 233: lib_Microsoft.VisualStudio.Services.TestResults.WebApi.dll.so => 71
	i64 u0x581a8bd5cfda563e, ; 234: System.Threading.Timer => 208
	i64 u0x582ff48bae35f9cc, ; 235: Microsoft.TeamFoundation.Policy.WebApi => 62
	i64 u0x58601b2dda4a27b9, ; 236: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 237: Microsoft.Extensions.DependencyInjection.dll => 43
	i64 u0x59430ff1a3060449, ; 238: lib_Microsoft.VisualStudio.Services.WebApi.dll.so => 74
	i64 u0x595a356d23e8da9a, ; 239: lib_Microsoft.CSharp.dll.so => 125
	i64 u0x5a0f9bb5b4d6200c, ; 240: NPOI.OpenXml4Net => 79
	i64 u0x5a89a886ae30258d, ; 241: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 100
	i64 u0x5a8f6699f4a1caa9, ; 242: lib_System.Threading.dll.so => 209
	i64 u0x5ae9cd33b15841bf, ; 243: System.ComponentModel => 136
	i64 u0x5b54391bdc6fcfe6, ; 244: System.Private.DataContractSerialization => 171
	i64 u0x5b5f0e240a06a2a2, ; 245: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5bf46332cc09e9b2, ; 246: lib_System.Data.SqlClient.dll.so => 92
	i64 u0x5c393624b8176517, ; 247: lib_Microsoft.Extensions.Logging.dll.so => 45
	i64 u0x5d0a4a29b02d9d3c, ; 248: System.Net.WebHeaderCollection.dll => 168
	i64 u0x5d3619fbfe8a8b84, ; 249: Microsoft.TeamFoundation.Common.dll => 72
	i64 u0x5d7ec76c1c703055, ; 250: System.Threading.Tasks.Parallel => 204
	i64 u0x5db0cbbd1028510e, ; 251: lib_System.Runtime.InteropServices.dll.so => 182
	i64 u0x5db30905d3e5013b, ; 252: Xamarin.AndroidX.Collection.Jvm.dll => 99
	i64 u0x5e467bc8f09ad026, ; 253: System.Collections.Specialized.dll => 130
	i64 u0x5ea92fdb19ec8c4c, ; 254: System.Text.Encodings.Web.dll => 200
	i64 u0x5eb8046dd40e9ac3, ; 255: System.ComponentModel.Primitives => 134
	i64 u0x5ec272d219c9aba4, ; 256: System.Security.Cryptography.Csp.dll => 191
	i64 u0x5f36ccf5c6a57e24, ; 257: System.Xml.ReaderWriter.dll => 213
	i64 u0x5f4294b9b63cb842, ; 258: System.Data.Common => 138
	i64 u0x5f7399e166075632, ; 259: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 87
	i64 u0x5f9a2d823f664957, ; 260: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x5fac98e0b37a5b9d, ; 261: System.Runtime.CompilerServices.Unsafe.dll => 179
	i64 u0x5fdf89780c783642, ; 262: Microsoft.TeamFoundation.Build2.WebApi.dll => 59
	i64 u0x609f4b7b63d802d4, ; 263: lib_Microsoft.Extensions.DependencyInjection.dll.so => 43
	i64 u0x60cd4e33d7e60134, ; 264: Xamarin.KotlinX.Coroutines.Core.Jvm => 122
	i64 u0x60f62d786afcf130, ; 265: System.Memory => 159
	i64 u0x61a3b9f0f15a3269, ; 266: lib_SixLabors.Fonts.dll.so => 82
	i64 u0x61bb78c89f867353, ; 267: System.IO => 156
	i64 u0x61be8d1299194243, ; 268: Microsoft.Maui.Controls.Xaml => 51
	i64 u0x61d2cba29557038f, ; 269: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 270: lib_System.Runtime.Loader.dll.so => 184
	i64 u0x622eef6f9e59068d, ; 271: System.Private.CoreLib => 219
	i64 u0x6400f68068c1e9f1, ; 272: Xamarin.Google.Android.Material.dll => 120
	i64 u0x640e3b14dbd325c2, ; 273: System.Security.Cryptography.Algorithms.dll => 190
	i64 u0x64ef1e444631e514, ; 274: lib_Microsoft.TeamFoundation.Dashboards.WebApi.dll.so => 61
	i64 u0x65ecac39144dd3cc, ; 275: Microsoft.Maui.Controls.dll => 50
	i64 u0x65ece51227bfa724, ; 276: lib_System.Runtime.Numerics.dll.so => 185
	i64 u0x6692e924eade1b29, ; 277: lib_System.Console.dll.so => 137
	i64 u0x66a4e5c6a3fb0bae, ; 278: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 108
	i64 u0x66d13304ce1a3efa, ; 279: Xamarin.AndroidX.CursorAdapter => 102
	i64 u0x68558ec653afa616, ; 280: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x6872ec7a2e36b1ac, ; 281: System.Drawing.Primitives.dll => 146
	i64 u0x68fbbbe2eb455198, ; 282: System.Formats.Asn1 => 148
	i64 u0x69063fc0ba8e6bdd, ; 283: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x699dffb2427a2d71, ; 284: SQLitePCLRaw.lib.e_sqlite3.android.dll => 87
	i64 u0x69d222aa41880d8a, ; 285: Microsoft.TeamFoundation.WorkItemTracking.WebApi.dll => 69
	i64 u0x6a4d7577b2317255, ; 286: System.Runtime.InteropServices.dll => 182
	i64 u0x6ace3b74b15ee4a4, ; 287: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6b72e812178e0d2c, ; 288: Microsoft.Azure.DevOps.Comments.WebApi => 57
	i64 u0x6d0a12b2adba20d8, ; 289: System.Security.Cryptography.ProtectedData.dll => 93
	i64 u0x6d12bfaa99c72b1f, ; 290: lib_Microsoft.Maui.Graphics.dll.so => 54
	i64 u0x6d593753d43dea6d, ; 291: Microsoft.VisualStudio.Services.TestResults.WebApi.dll => 71
	i64 u0x6d70755158ca866e, ; 292: lib_System.ComponentModel.EventBasedAsync.dll.so => 133
	i64 u0x6d79993361e10ef2, ; 293: Microsoft.Extensions.Primitives => 48
	i64 u0x6d86d56b84c8eb71, ; 294: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 102
	i64 u0x6d9bea6b3e895cf7, ; 295: Microsoft.Extensions.Primitives.dll => 48
	i64 u0x6de66846b004f453, ; 296: Microsoft.VisualStudio.Services.Common.dll => 73
	i64 u0x6e25a02c3833319a, ; 297: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 112
	i64 u0x6ef94afcdd730353, ; 298: Microsoft.TeamFoundation.TestManagement.WebApi.dll => 65
	i64 u0x6fd2265da78b93a4, ; 299: lib_Microsoft.Maui.dll.so => 52
	i64 u0x6fdfc7de82c33008, ; 300: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x6ffc4967cc47ba57, ; 301: System.IO.FileSystem.Watcher.dll => 152
	i64 u0x701cd46a1c25a5fe, ; 302: System.IO.FileSystem.dll => 153
	i64 u0x70e99f48c05cb921, ; 303: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 304: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 305: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 306: System.ComponentModel.Primitives.dll => 134
	i64 u0x71fb77e68dfe8984, ; 307: GenericMaui.dll => 124
	i64 u0x725f5a9e82a45c81, ; 308: System.Security.Cryptography.Encoding => 192
	i64 u0x72b1fb4109e08d7b, ; 309: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x7335564626169482, ; 310: lib_Microsoft.TeamFoundation.TestManagement.WebApi.dll.so => 65
	i64 u0x73e4ce94e2eb6ffc, ; 311: lib_System.Memory.dll.so => 159
	i64 u0x755a91767330b3d4, ; 312: lib_Microsoft.Extensions.Configuration.dll.so => 41
	i64 u0x75b7771d8e6703e2, ; 313: Microsoft.Azure.DevOps.Comments.WebApi.dll => 57
	i64 u0x75f59536ad2b55b1, ; 314: SixLabors.Fonts => 82
	i64 u0x76012e7334db86e5, ; 315: lib_Xamarin.AndroidX.SavedState.dll.so => 116
	i64 u0x76ca07b878f44da0, ; 316: System.Runtime.Numerics.dll => 185
	i64 u0x76e7fae0f3c76066, ; 317: lib_Microsoft.TeamFoundation.Policy.WebApi.dll.so => 62
	i64 u0x780bc73597a503a9, ; 318: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 319: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 320: Xamarin.AndroidX.Fragment.dll => 105
	i64 u0x7a14a9cb254b8464, ; 321: Microsoft.TeamFoundation.Test.WebApi => 64
	i64 u0x7a67b8a270b82e7e, ; 322: lib_NPOI.Core.dll.so => 77
	i64 u0x7adb8da2ac89b647, ; 323: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7bcebf0eb1ed3948, ; 324: lib_MathNet.Numerics.dll.so => 39
	i64 u0x7bef86a4335c4870, ; 325: System.ComponentModel.TypeConverter => 135
	i64 u0x7c0820144cd34d6a, ; 326: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 327: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7c41d387501568ba, ; 328: System.Net.WebClient.dll => 167
	i64 u0x7d649b75d580bb42, ; 329: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 330: System.Numerics.Vectors => 169
	i64 u0x7dfc3d6d9d8d7b70, ; 331: System.Collections => 131
	i64 u0x7e1f8f575a3599cb, ; 332: BouncyCastle.Cryptography.dll => 35
	i64 u0x7e2e564fa2f76c65, ; 333: lib_System.Diagnostics.Tracing.dll.so => 145
	i64 u0x7e302e110e1e1346, ; 334: lib_System.Security.Claims.dll.so => 189
	i64 u0x7e4084a672f9c30e, ; 335: lib_System.Security.Cryptography.Xml.dll.so => 94
	i64 u0x7e4b37f13694af03, ; 336: lib_Microsoft.TeamFoundation.Work.WebApi.dll.so => 67
	i64 u0x7e946809d6008ef2, ; 337: lib_System.ObjectModel.dll.so => 170
	i64 u0x7ecc13347c8fd849, ; 338: lib_System.ComponentModel.dll.so => 136
	i64 u0x7f00ddd9b9ca5a13, ; 339: Xamarin.AndroidX.ViewPager.dll => 118
	i64 u0x7f44178d8ba8c375, ; 340: MS.TF.Pipelines.WebApi.NetStandard.dll => 56
	i64 u0x7f903af8afd7c6c3, ; 341: lib_SQLitePCLRaw.provider.dynamic_cdecl.dll.so => 88
	i64 u0x7f9351cd44b1273f, ; 342: Microsoft.Extensions.Configuration.Abstractions => 42
	i64 u0x7fbd557c99b3ce6f, ; 343: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 107
	i64 u0x8078c12ab831fadc, ; 344: lib_GenericMaui.dll.so => 124
	i64 u0x80fa55b6d1b0be99, ; 345: SQLitePCLRaw.provider.e_sqlite3 => 89
	i64 u0x812c069d5cdecc17, ; 346: System.dll => 217
	i64 u0x81ab745f6c0f5ce6, ; 347: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8277f2be6b5ce05f, ; 348: Xamarin.AndroidX.AppCompat => 96
	i64 u0x828f06563b30bc50, ; 349: lib_Xamarin.AndroidX.CardView.dll.so => 98
	i64 u0x82df8f5532a10c59, ; 350: lib_System.Drawing.dll.so => 147
	i64 u0x82f6403342e12049, ; 351: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83144699b312ad81, ; 352: SQLite-net.dll => 84
	i64 u0x837b40a260a811d5, ; 353: lib_Microsoft.TeamFoundation.SourceControl.WebApi.dll.so => 63
	i64 u0x83c14ba66c8e2b8c, ; 354: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x846ce984efea52c7, ; 355: System.Threading.Tasks.Parallel.dll => 204
	i64 u0x84ae73148a4557d2, ; 356: lib_System.IO.Pipes.dll.so => 155
	i64 u0x84d526f04582b100, ; 357: Microsoft.TeamFoundation.Core.WebApi.dll => 60
	i64 u0x86a909228dc7657b, ; 358: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 359: Microsoft.Extensions.Configuration.dll => 41
	i64 u0x8702a8575d9d19bd, ; 360: Microsoft.TeamFoundation.Wiki.WebApi => 66
	i64 u0x8738d9ebac619256, ; 361: lib_Microsoft.TeamFoundation.DistributedTask.Common.Contracts.dll.so => 55
	i64 u0x87c69b87d9283884, ; 362: lib_System.Threading.Thread.dll.so => 206
	i64 u0x87f6569b25707834, ; 363: System.IO.Compression.Brotli.dll => 150
	i64 u0x8842b3a5d2d3fb36, ; 364: Microsoft.Maui.Essentials => 53
	i64 u0x88bda98e0cffb7a9, ; 365: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 122
	i64 u0x8930322c7bd8f768, ; 366: netstandard => 218
	i64 u0x897a606c9e39c75f, ; 367: lib_System.ComponentModel.Primitives.dll.so => 134
	i64 u0x89c5188089ec2cd5, ; 368: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 181
	i64 u0x8ad229ea26432ee2, ; 369: Xamarin.AndroidX.Loader => 110
	i64 u0x8b4ff5d0fdd5faa1, ; 370: lib_System.Diagnostics.DiagnosticSource.dll.so => 140
	i64 u0x8b541d476eb3774c, ; 371: System.Security.Principal.Windows => 196
	i64 u0x8b8d01333a96d0b5, ; 372: System.Diagnostics.Process.dll => 141
	i64 u0x8b9ceca7acae3451, ; 373: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8c4e8fc055a910fb, ; 374: lib_SixLabors.ImageSharp.dll.so => 83
	i64 u0x8cdfdb4ce85fb925, ; 375: lib_System.Security.Principal.Windows.dll.so => 196
	i64 u0x8d0f420977c2c1c7, ; 376: Xamarin.AndroidX.CursorAdapter.dll => 102
	i64 u0x8d7b8ab4b3310ead, ; 377: System.Threading => 209
	i64 u0x8da188285aadfe8e, ; 378: System.Collections.Concurrent => 128
	i64 u0x8ec6e06a61c1baeb, ; 379: lib_Newtonsoft.Json.dll.so => 75
	i64 u0x8ed807bfe9858dfc, ; 380: Xamarin.AndroidX.Navigation.Common => 111
	i64 u0x8ee08b8194a30f48, ; 381: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef5a41ebe9f5b40, ; 382: NPOI.OpenXml4Net.dll => 79
	i64 u0x8ef7601039857a44, ; 383: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8ef9414937d93a0a, ; 384: SQLitePCLRaw.core.dll => 86
	i64 u0x8f32c6f611f6ffab, ; 385: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 386: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x8fbf5b0114c6dcef, ; 387: System.Globalization.dll => 149
	i64 u0x8fd27d934d7b3a55, ; 388: SQLitePCLRaw.core => 86
	i64 u0x90263f8448b8f572, ; 389: lib_System.Diagnostics.TraceSource.dll.so => 144
	i64 u0x903101b46fb73a04, ; 390: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 391: lib_System.IO.Compression.dll.so => 151
	i64 u0x90634f86c5ebe2b5, ; 392: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 108
	i64 u0x907b636704ad79ef, ; 393: lib_Microsoft.Maui.Controls.Xaml.dll.so => 51
	i64 u0x91418dc638b29e68, ; 394: lib_Xamarin.AndroidX.CustomView.dll.so => 103
	i64 u0x9157bd523cd7ed36, ; 395: lib_System.Text.Json.dll.so => 201
	i64 u0x91a74f07b30d37e2, ; 396: System.Linq.dll => 158
	i64 u0x91fa41a87223399f, ; 397: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 398: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 399: System.IO.Compression.dll => 151
	i64 u0x967fc325e09bfa8c, ; 400: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 401: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 402: Microsoft.Maui.Graphics.dll => 54
	i64 u0x97b8c771ea3e4220, ; 403: System.ComponentModel.dll => 136
	i64 u0x97e144c9d3c6976e, ; 404: System.Collections.Concurrent.dll => 128
	i64 u0x98d70883c4beabde, ; 405: ExtendedNumerics.BigDecimal.dll => 38
	i64 u0x991d510397f92d9d, ; 406: System.Linq.Expressions => 157
	i64 u0x99848297d0d6a913, ; 407: Enums.NET => 37
	i64 u0x999cb19e1a04ffd3, ; 408: CommunityToolkit.Mvvm.dll => 36
	i64 u0x99a00ca5270c6878, ; 409: Xamarin.AndroidX.Navigation.Runtime => 113
	i64 u0x99cdc6d1f2d3a72f, ; 410: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9a816d9654deff7c, ; 411: Microsoft.IO.RecyclableMemoryStream => 49
	i64 u0x9b211a749105beac, ; 412: System.Transactions.Local => 210
	i64 u0x9c244ac7cda32d26, ; 413: System.Security.Cryptography.X509Certificates.dll => 194
	i64 u0x9c8dec1a04bba721, ; 414: NPOI.OOXML.dll => 78
	i64 u0x9c9ac1d95198ac57, ; 415: Newtonsoft.Json.Bson.dll => 76
	i64 u0x9d5dbcf5a48583fe, ; 416: lib_Xamarin.AndroidX.Activity.dll.so => 95
	i64 u0x9d74dee1a7725f34, ; 417: Microsoft.Extensions.Configuration.Abstractions.dll => 42
	i64 u0x9e4534b6adaf6e84, ; 418: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9e4b95dec42769f7, ; 419: System.Diagnostics.Debug.dll => 139
	i64 u0x9eaf1efdf6f7267e, ; 420: Xamarin.AndroidX.Navigation.Common.dll => 111
	i64 u0x9ef542cf1f78c506, ; 421: Xamarin.AndroidX.Lifecycle.LiveData.Core => 107
	i64 u0xa0d8259f4cc284ec, ; 422: lib_System.Security.Cryptography.dll.so => 195
	i64 u0xa12fbfb4da97d9f3, ; 423: System.Threading.Timer.dll => 208
	i64 u0xa1440773ee9d341e, ; 424: Xamarin.Google.Android.Material => 120
	i64 u0xa1b9d7c27f47219f, ; 425: Xamarin.AndroidX.Navigation.UI.dll => 114
	i64 u0xa2572680829d2c7c, ; 426: System.IO.Pipelines.dll => 154
	i64 u0xa46aa1eaa214539b, ; 427: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa4d20d2ff0563d26, ; 428: lib_CommunityToolkit.Mvvm.dll.so => 36
	i64 u0xa4edc8f2ceae241a, ; 429: System.Data.Common.dll => 138
	i64 u0xa5494f40f128ce6a, ; 430: System.Runtime.Serialization.Formatters.dll => 186
	i64 u0xa5634375ded68ca4, ; 431: MathNet.Numerics.dll => 39
	i64 u0xa5b7152421ed6d98, ; 432: lib_System.IO.FileSystem.Watcher.dll.so => 152
	i64 u0xa5ce5c755bde8cb8, ; 433: lib_System.Security.Cryptography.Csp.dll.so => 191
	i64 u0xa5e599d1e0524750, ; 434: System.Numerics.Vectors.dll => 169
	i64 u0xa5f1ba49b85dd355, ; 435: System.Security.Cryptography.dll => 195
	i64 u0xa61975a5a37873ea, ; 436: lib_System.Xml.XmlSerializer.dll.so => 216
	i64 u0xa67dbee13e1df9ca, ; 437: Xamarin.AndroidX.SavedState.dll => 116
	i64 u0xa68a420042bb9b1f, ; 438: Xamarin.AndroidX.DrawerLayout.dll => 104
	i64 u0xa72660a373f4abc3, ; 439: NPOI.Core => 77
	i64 u0xa763fbb98df8d9fb, ; 440: lib_Microsoft.Win32.Primitives.dll.so => 126
	i64 u0xa78ce3745383236a, ; 441: Xamarin.AndroidX.Lifecycle.Common.Jvm => 106
	i64 u0xa7c31b56b4dc7b33, ; 442: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa7eb6bbeaebf5a8d, ; 443: NPOI.OpenXmlFormats.dll => 80
	i64 u0xaa2219c8e3449ff5, ; 444: Microsoft.Extensions.Logging.Abstractions => 46
	i64 u0xaa36c6439964ed3c, ; 445: Microsoft.VisualStudio.Services.TestResults.WebApi => 71
	i64 u0xaa443ac34067eeef, ; 446: System.Private.Xml.dll => 174
	i64 u0xaa52de307ef5d1dd, ; 447: System.Net.Http => 160
	i64 u0xaaaf86367285a918, ; 448: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 44
	i64 u0xaaf84bb3f052a265, ; 449: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab419331254b1e6e, ; 450: Enums.NET.dll => 37
	i64 u0xab9c1b2687d86b0b, ; 451: lib_System.Linq.Expressions.dll.so => 157
	i64 u0xabfe4d78f1af882a, ; 452: NPOI.OpenXmlFormats => 80
	i64 u0xac2af3fa195a15ce, ; 453: System.Runtime.Numerics => 185
	i64 u0xac5376a2a538dc10, ; 454: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 107
	i64 u0xac5acae88f60357e, ; 455: System.Diagnostics.Tools.dll => 143
	i64 u0xac79c7e46047ad98, ; 456: System.Security.Principal.Windows.dll => 196
	i64 u0xac98d31068e24591, ; 457: System.Xml.XDocument => 214
	i64 u0xacd46e002c3ccb97, ; 458: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 459: System.Threading.Channels => 203
	i64 u0xad53b38782fb1a3d, ; 460: ICSharpCode.SharpZipLib => 81
	i64 u0xad89c07347f1bad6, ; 461: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 462: System.Web.HttpUtility => 211
	i64 u0xadc90ab061a9e6e4, ; 463: System.ComponentModel.TypeConverter.dll => 135
	i64 u0xadf511667bef3595, ; 464: System.Net.Security => 165
	i64 u0xae0aaa94fdcfce0f, ; 465: System.ComponentModel.EventBasedAsync.dll => 133
	i64 u0xae282bcd03739de7, ; 466: Java.Interop => 220
	i64 u0xae53579c90db1107, ; 467: System.ObjectModel.dll => 170
	i64 u0xae7ea18c61eef394, ; 468: SQLite-net => 84
	i64 u0xafe29f45095518e7, ; 469: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 109
	i64 u0xb05b6f0a6cc8ddbb, ; 470: lib_Microsoft.IO.RecyclableMemoryStream.dll.so => 49
	i64 u0xb05cc42cd94c6d9d, ; 471: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb0bb43dc52ea59f9, ; 472: System.Diagnostics.Tracing.dll => 145
	i64 u0xb220631954820169, ; 473: System.Text.RegularExpressions => 202
	i64 u0xb2376e1dbf8b4ed7, ; 474: System.Security.Cryptography.Csp => 191
	i64 u0xb2602c583b0f5a70, ; 475: Microsoft.TeamFoundation.WorkItemTracking.Process.WebApi => 68
	i64 u0xb2a3f67f3bf29fce, ; 476: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb3946bc8a192ef06, ; 477: Microsoft.TeamFoundation.Common => 72
	i64 u0xb398860d6ed7ba2f, ; 478: System.Security.Cryptography.ProtectedData => 93
	i64 u0xb3f0a0fcda8d3ebc, ; 479: Xamarin.AndroidX.CardView => 98
	i64 u0xb46be1aa6d4fff93, ; 480: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 481: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 482: System.IO.Pipelines => 154
	i64 u0xb5c38bf497a4cfe2, ; 483: lib_System.Threading.Tasks.dll.so => 205
	i64 u0xb5c7fcdafbc67ee4, ; 484: Microsoft.Extensions.Logging.Abstractions.dll => 46
	i64 u0xb5ea31d5244c6626, ; 485: System.Threading.ThreadPool.dll => 207
	i64 u0xb6def48bace2e4b8, ; 486: lib_MS.TF.Pipelines.WebApi.NetStandard.dll.so => 56
	i64 u0xb7212c4683a94afe, ; 487: System.Drawing.Primitives => 146
	i64 u0xb7b7753d1f319409, ; 488: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 489: lib_System.Private.CoreLib.dll.so => 219
	i64 u0xb8e68d20aad91196, ; 490: lib_System.Xml.XPath.dll.so => 215
	i64 u0xb9185c33a1643eed, ; 491: Microsoft.CSharp.dll => 125
	i64 u0xb9f64d3b230def68, ; 492: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 493: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba35e84542a5f7e5, ; 494: Microsoft.TeamFoundation.SourceControl.WebApi.dll => 63
	i64 u0xba4241db9ef2f88f, ; 495: Microsoft.TeamFoundation.Dashboards.WebApi => 61
	i64 u0xba4670aa94a2b3c6, ; 496: lib_System.Xml.XDocument.dll.so => 214
	i64 u0xba48785529705af9, ; 497: System.Collections.dll => 131
	i64 u0xbb65706fde942ce3, ; 498: System.Net.Sockets => 166
	i64 u0xbbd180354b67271a, ; 499: System.Runtime.Serialization.Formatters => 186
	i64 u0xbc22a245dab70cb4, ; 500: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 89
	i64 u0xbd0e2c0d55246576, ; 501: System.Net.Http.dll => 160
	i64 u0xbd3a700217b2405a, ; 502: lib_Enums.NET.dll.so => 37
	i64 u0xbd437a2cdb333d0d, ; 503: Xamarin.AndroidX.ViewPager2 => 119
	i64 u0xbd877b14d0b56392, ; 504: System.Runtime.Intrinsics.dll => 183
	i64 u0xbe65a49036345cf4, ; 505: lib_System.Buffers.dll.so => 127
	i64 u0xbea82a18727b8d18, ; 506: lib_System.Net.Http.Formatting.dll.so => 40
	i64 u0xbee38d4a88835966, ; 507: Xamarin.AndroidX.AppCompat.AppCompatResources => 97
	i64 u0xbf57209deda71318, ; 508: Microsoft.TeamFoundation.SourceControl.WebApi => 63
	i64 u0xc01d26e631e5e35f, ; 509: SQLitePCLRaw.provider.sqlite3 => 90
	i64 u0xc040a4ab55817f58, ; 510: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 511: System.Console.dll => 137
	i64 u0xc0f5a221a9383aea, ; 512: System.Runtime.Intrinsics => 183
	i64 u0xc12b8b3afa48329c, ; 513: lib_System.Linq.dll.so => 158
	i64 u0xc19da3ecfbd16a00, ; 514: lib_Microsoft.TeamFoundation.Common.dll.so => 72
	i64 u0xc1ff9ae3cdb6e1e6, ; 515: Xamarin.AndroidX.Activity.dll => 95
	i64 u0xc2260e1da1054ac1, ; 516: lib_BouncyCastle.Cryptography.dll.so => 35
	i64 u0xc26c064effb1dea9, ; 517: System.Buffers.dll => 127
	i64 u0xc28c50f32f81cc73, ; 518: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2a3bca55b573141, ; 519: System.IO.FileSystem.Watcher => 152
	i64 u0xc2bcfec99f69365e, ; 520: Xamarin.AndroidX.ViewPager2.dll => 119
	i64 u0xc4957108069a2e30, ; 521: lib_ICSharpCode.SharpZipLib.dll.so => 81
	i64 u0xc4d3858ed4d08512, ; 522: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 109
	i64 u0xc50fded0ded1418c, ; 523: lib_System.ComponentModel.TypeConverter.dll.so => 135
	i64 u0xc519125d6bc8fb11, ; 524: lib_System.Net.Requests.dll.so => 164
	i64 u0xc5293b19e4dc230e, ; 525: Xamarin.AndroidX.Navigation.Fragment => 112
	i64 u0xc5325b2fcb37446f, ; 526: lib_System.Private.Xml.dll.so => 174
	i64 u0xc5a0f4b95a699af7, ; 527: lib_System.Private.Uri.dll.so => 172
	i64 u0xc5cdcd5b6277579e, ; 528: lib_System.Security.Cryptography.Algorithms.dll.so => 190
	i64 u0xc7c01e7d7c93a110, ; 529: System.Text.Encoding.Extensions.dll => 198
	i64 u0xc7ce851898a4548e, ; 530: lib_System.Web.HttpUtility.dll.so => 211
	i64 u0xc858a28d9ee5a6c5, ; 531: lib_System.Collections.Specialized.dll.so => 130
	i64 u0xc9c62c8f354ac568, ; 532: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 142
	i64 u0xca3a723e7342c5b6, ; 533: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xca5801070d9fccfb, ; 534: System.Text.Encoding => 199
	i64 u0xcab3493c70141c2d, ; 535: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 536: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcba6056f87ed95e8, ; 537: System.Net.Http.Formatting.dll => 40
	i64 u0xcbd4fdd9cef4a294, ; 538: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc2876b32ef2794c, ; 539: lib_System.Text.RegularExpressions.dll.so => 202
	i64 u0xcc5c3bb714c4561e, ; 540: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 122
	i64 u0xcc76886e09b88260, ; 541: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 123
	i64 u0xccf25c4b634ccd3a, ; 542: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 543: System.Net.Requests => 164
	i64 u0xcdd0c48b6937b21c, ; 544: Xamarin.AndroidX.SwipeRefreshLayout => 117
	i64 u0xcef65cbf0b19b1e3, ; 545: Newtonsoft.Json.Bson => 76
	i64 u0xcf23d8093f3ceadf, ; 546: System.Diagnostics.DiagnosticSource.dll => 140
	i64 u0xcf8fc898f98b0d34, ; 547: System.Private.Xml.Linq => 173
	i64 u0xd007258538786e4a, ; 548: Microsoft.VisualStudio.Services.TestManagement.TestPlanning.WebApi => 70
	i64 u0xd03c13362192742f, ; 549: Microsoft.TeamFoundation.Core.WebApi => 60
	i64 u0xd0de8a113e976700, ; 550: System.Diagnostics.TextWriterTraceListener => 142
	i64 u0xd0fc33d5ae5d4cb8, ; 551: System.Runtime.Extensions => 180
	i64 u0xd1194e1d8a8de83c, ; 552: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 106
	i64 u0xd22a0c4630f2fe66, ; 553: lib_System.Security.Cryptography.ProtectedData.dll.so => 93
	i64 u0xd333d0af9e423810, ; 554: System.Runtime.InteropServices => 182
	i64 u0xd33a415cb4278969, ; 555: System.Security.Cryptography.Encoding.dll => 192
	i64 u0xd3426d966bb704f5, ; 556: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 97
	i64 u0xd3651b6fc3125825, ; 557: System.Private.Uri.dll => 172
	i64 u0xd373685349b1fe8b, ; 558: Microsoft.Extensions.Logging.dll => 45
	i64 u0xd3801faafafb7698, ; 559: System.Private.DataContractSerialization.dll => 171
	i64 u0xd3e4c8d6a2d5d470, ; 560: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 561: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 44
	i64 u0xd5507e11a2b2839f, ; 562: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 109
	i64 u0xd6694f8359737e4e, ; 563: Xamarin.AndroidX.SavedState => 116
	i64 u0xd6d21782156bc35b, ; 564: Xamarin.AndroidX.SwipeRefreshLayout.dll => 117
	i64 u0xd72329819cbbbc44, ; 565: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 42
	i64 u0xd72c760af136e863, ; 566: System.Xml.XmlSerializer.dll => 216
	i64 u0xd7b3764ada9d341d, ; 567: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 46
	i64 u0xd955a04610a32378, ; 568: NPOI.OOXML => 78
	i64 u0xd9e245a1762ddad5, ; 569: BouncyCastle.Cryptography => 35
	i64 u0xd9e828685f4d03dc, ; 570: lib_Microsoft.TeamFoundation.WorkItemTracking.WebApi.dll.so => 69
	i64 u0xda1dfa4c534a9251, ; 571: Microsoft.Extensions.DependencyInjection => 43
	i64 u0xdad05a11827959a3, ; 572: System.Collections.NonGeneric.dll => 129
	i64 u0xdb5383ab5865c007, ; 573: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdb58816721c02a59, ; 574: lib_System.Reflection.Emit.ILGeneration.dll.so => 175
	i64 u0xdb8ebbe916e760c0, ; 575: lib_Microsoft.TeamFoundation.Test.WebApi.dll.so => 64
	i64 u0xdbeda89f832aa805, ; 576: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf2a779fbc3ac31, ; 577: System.Transactions.Local.dll => 210
	i64 u0xdbf9607a441b4505, ; 578: System.Linq => 158
	i64 u0xdbfc90157a0de9b0, ; 579: lib_System.Text.Encoding.dll.so => 199
	i64 u0xdc75032002d1a212, ; 580: lib_System.Transactions.Local.dll.so => 210
	i64 u0xdc870d68ecdbd334, ; 581: GenericMaui => 124
	i64 u0xdce2c53525640bf3, ; 582: Microsoft.Extensions.Logging => 45
	i64 u0xdd2b722d78ef5f43, ; 583: System.Runtime.dll => 188
	i64 u0xdd67031857c72f96, ; 584: lib_System.Text.Encodings.Web.dll.so => 200
	i64 u0xdde30e6b77aa6f6c, ; 585: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xde110ae80fa7c2e2, ; 586: System.Xml.XDocument.dll => 214
	i64 u0xde117ffb56dbbb37, ; 587: Microsoft.TeamFoundation.Test.WebApi.dll => 64
	i64 u0xde8769ebda7d8647, ; 588: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 589: Xamarin.AndroidX.AppCompat.dll => 96
	i64 u0xe021eaa401792a05, ; 590: System.Text.Encoding.dll => 199
	i64 u0xe02f89350ec78051, ; 591: Xamarin.AndroidX.CoordinatorLayout.dll => 100
	i64 u0xe0ac7267f19ad9a5, ; 592: Microsoft.VisualStudio.Services.WebApi => 74
	i64 u0xe10b760bb1462e7a, ; 593: lib_System.Security.Cryptography.Primitives.dll.so => 193
	i64 u0xe192a588d4410686, ; 594: lib_System.IO.Pipelines.dll.so => 154
	i64 u0xe194db49531f9bc2, ; 595: lib_Microsoft.TeamFoundation.Wiki.WebApi.dll.so => 66
	i64 u0xe1a08bd3fa539e0d, ; 596: System.Runtime.Loader => 184
	i64 u0xe1ace591eebb7293, ; 597: lib_Newtonsoft.Json.Bson.dll.so => 76
	i64 u0xe1b52f9f816c70ef, ; 598: System.Private.Xml.Linq.dll => 173
	i64 u0xe1ecfdb7fff86067, ; 599: System.Net.Security.dll => 165
	i64 u0xe22fa4c9c645db62, ; 600: System.Diagnostics.TextWriterTraceListener.dll => 142
	i64 u0xe2420585aeceb728, ; 601: System.Net.Requests.dll => 164
	i64 u0xe29b73bc11392966, ; 602: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe2e426c7714fa0bc, ; 603: Microsoft.Win32.Primitives.dll => 126
	i64 u0xe3811d68d4fe8463, ; 604: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe3a586956771a0ed, ; 605: lib_SQLite-net.dll.so => 84
	i64 u0xe3b7cbae5ad66c75, ; 606: lib_System.Security.Cryptography.Encoding.dll.so => 192
	i64 u0xe494f7ced4ecd10a, ; 607: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 608: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe4f74a0b5bf9703f, ; 609: System.Runtime.Serialization.Primitives => 187
	i64 u0xe5434e8a119ceb69, ; 610: lib_Mono.Android.dll.so => 222
	i64 u0xe55703b9ce5c038a, ; 611: System.Diagnostics.Tools => 143
	i64 u0xe57d22ca4aeb4900, ; 612: System.Configuration.ConfigurationManager => 91
	i64 u0xe89a2a9ef110899b, ; 613: System.Drawing.dll => 147
	i64 u0xe975d06779bc7baf, ; 614: SixLabors.Fonts.dll => 82
	i64 u0xebf54cd7f48b8f26, ; 615: MathNet.Numerics => 39
	i64 u0xeca593e6696030cc, ; 616: SQLitePCLRaw.provider.dynamic_cdecl => 88
	i64 u0xedc4817167106c23, ; 617: System.Net.Sockets.dll => 166
	i64 u0xedc632067fb20ff3, ; 618: System.Memory.dll => 159
	i64 u0xedc8e4ca71a02a8b, ; 619: Xamarin.AndroidX.Navigation.Runtime.dll => 113
	i64 u0xede195f09c234292, ; 620: Microsoft.TeamFoundation.Work.WebApi.dll => 67
	i64 u0xee81f5b3f1c4f83b, ; 621: System.Threading.ThreadPool => 207
	i64 u0xeeb7ebb80150501b, ; 622: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 99
	i64 u0xef03b1b5a04e9709, ; 623: System.Text.Encoding.CodePages.dll => 197
	i64 u0xef72742e1bcca27a, ; 624: Microsoft.Maui.Essentials.dll => 53
	i64 u0xefd1e0c4e5c9b371, ; 625: System.Resources.ResourceManager.dll => 178
	i64 u0xefec0b7fdc57ec42, ; 626: Xamarin.AndroidX.Activity => 95
	i64 u0xf00c29406ea45e19, ; 627: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 628: System.Net.NameResolution => 161
	i64 u0xf0ac2b489fed2e35, ; 629: lib_System.Diagnostics.Debug.dll.so => 139
	i64 u0xf0de2537ee19c6ca, ; 630: lib_System.Net.WebHeaderCollection.dll.so => 168
	i64 u0xf11b621fc87b983f, ; 631: Microsoft.Maui.Controls.Xaml.dll => 51
	i64 u0xf1c4b4005493d871, ; 632: System.Formats.Asn1.dll => 148
	i64 u0xf238bd79489d3a96, ; 633: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 634: lib_Xamarin.Google.Android.Material.dll.so => 120
	i64 u0xf3ddfe05336abf29, ; 635: System => 217
	i64 u0xf408654b2a135055, ; 636: System.Reflection.Emit.ILGeneration.dll => 175
	i64 u0xf4c1dd70a5496a17, ; 637: System.IO.Compression => 151
	i64 u0xf4c291d199995685, ; 638: Microsoft.TeamFoundation.WorkItemTracking.Process.WebApi.dll => 68
	i64 u0xf518f63ead11fcd1, ; 639: System.Threading.Tasks => 205
	i64 u0xf5fc7602fe27b333, ; 640: System.Net.WebHeaderCollection => 168
	i64 u0xf6077741019d7428, ; 641: Xamarin.AndroidX.CoordinatorLayout => 100
	i64 u0xf77b20923f07c667, ; 642: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e2cac4c45067b3, ; 643: lib_System.Numerics.Vectors.dll.so => 169
	i64 u0xf7e74930e0e3d214, ; 644: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf7fa0bf77fe677cc, ; 645: Newtonsoft.Json.dll => 75
	i64 u0xf84773b5c81e3cef, ; 646: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8b77539b362d3ba, ; 647: lib_System.Reflection.Primitives.dll.so => 177
	i64 u0xf8e045dc345b2ea3, ; 648: lib_Xamarin.AndroidX.RecyclerView.dll.so => 115
	i64 u0xf915dc29808193a1, ; 649: System.Web.HttpUtility.dll => 211
	i64 u0xf96c777a2a0686f4, ; 650: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 651: Microsoft.Extensions.Options => 47
	i64 u0xfa2fdb27e8a2c8e8, ; 652: System.ComponentModel.EventBasedAsync => 133
	i64 u0xfa3f278f288b0e84, ; 653: lib_System.Net.Security.dll.so => 165
	i64 u0xfa5ed7226d978949, ; 654: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 655: System.Threading.Thread => 206
	i64 u0xfb022853d73b7fa5, ; 656: lib_SQLitePCLRaw.batteries_v2.dll.so => 85
	i64 u0xfb64744366959b2a, ; 657: lib_Microsoft.TeamFoundation.Core.WebApi.dll.so => 60
	i64 u0xfbad3e4ce4b98145, ; 658: System.Security.Cryptography.X509Certificates => 194
	i64 u0xfbf0a31c9fc34bc4, ; 659: lib_System.Net.Http.dll.so => 160
	i64 u0xfc6b7527cc280b3f, ; 660: lib_System.Runtime.Serialization.Formatters.dll.so => 186
	i64 u0xfc719aec26adf9d9, ; 661: Xamarin.AndroidX.Navigation.Fragment.dll => 112
	i64 u0xfcd5b90cf101e36b, ; 662: System.Data.SqlClient.dll => 92
	i64 u0xfd22f00870e40ae0, ; 663: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 104
	i64 u0xfd49b3c1a76e2748, ; 664: System.Runtime.InteropServices.RuntimeInformation => 181
	i64 u0xfd536c702f64dc47, ; 665: System.Text.Encoding.Extensions => 198
	i64 u0xfd583f7657b6a1cb, ; 666: Xamarin.AndroidX.Fragment => 105
	i64 u0xfe823d402db1d205, ; 667: Microsoft.TeamFoundation.Dashboards.WebApi.dll => 61
	i64 u0xfeae9952cf03b8cb ; 668: tr/Microsoft.Maui.Controls.resources => 28
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [669 x i32] [
	i32 149, i32 117, i32 132, i32 113, i32 221, i32 96, i32 49, i32 38,
	i32 127, i32 89, i32 171, i32 24, i32 2, i32 30, i32 163, i32 115,
	i32 131, i32 52, i32 179, i32 31, i32 212, i32 99, i32 215, i32 24,
	i32 129, i32 68, i32 177, i32 104, i32 132, i32 47, i32 129, i32 195,
	i32 94, i32 203, i32 25, i32 123, i32 118, i32 21, i32 57, i32 222,
	i32 53, i32 66, i32 161, i32 55, i32 79, i32 81, i32 103, i32 150,
	i32 193, i32 176, i32 115, i32 56, i32 8, i32 220, i32 9, i32 44,
	i32 126, i32 153, i32 155, i32 190, i32 218, i32 12, i32 200, i32 123,
	i32 167, i32 18, i32 189, i32 128, i32 217, i32 27, i32 67, i32 58,
	i32 221, i32 205, i32 114, i32 16, i32 204, i32 47, i32 216, i32 59,
	i32 167, i32 38, i32 150, i32 141, i32 149, i32 188, i32 175, i32 27,
	i32 155, i32 208, i32 206, i32 178, i32 137, i32 101, i32 58, i32 187,
	i32 8, i32 85, i32 121, i32 48, i32 156, i32 13, i32 11, i32 220,
	i32 139, i32 163, i32 29, i32 162, i32 144, i32 7, i32 202, i32 148,
	i32 33, i32 83, i32 20, i32 197, i32 176, i32 173, i32 209, i32 26,
	i32 73, i32 201, i32 74, i32 153, i32 5, i32 141, i32 213, i32 145,
	i32 105, i32 34, i32 70, i32 98, i32 146, i32 8, i32 213, i32 77,
	i32 6, i32 166, i32 52, i32 2, i32 50, i32 132, i32 119, i32 41,
	i32 183, i32 70, i32 143, i32 180, i32 176, i32 177, i32 156, i32 179,
	i32 103, i32 161, i32 91, i32 118, i32 1, i32 75, i32 73, i32 90,
	i32 193, i32 40, i32 198, i32 194, i32 121, i32 92, i32 207, i32 212,
	i32 101, i32 85, i32 55, i32 111, i32 91, i32 97, i32 62, i32 178,
	i32 215, i32 78, i32 218, i32 222, i32 20, i32 125, i32 187, i32 121,
	i32 144, i32 94, i32 24, i32 83, i32 212, i32 22, i32 170, i32 114,
	i32 180, i32 201, i32 59, i32 110, i32 162, i32 157, i32 174, i32 184,
	i32 14, i32 110, i32 221, i32 197, i32 203, i32 1, i32 87, i32 69,
	i32 50, i32 36, i32 65, i32 108, i32 147, i32 163, i32 138, i32 101,
	i32 90, i32 54, i32 25, i32 162, i32 181, i32 31, i32 58, i32 189,
	i32 188, i32 88, i32 106, i32 130, i32 80, i32 172, i32 86, i32 219,
	i32 140, i32 71, i32 208, i32 62, i32 15, i32 43, i32 74, i32 125,
	i32 79, i32 100, i32 209, i32 136, i32 171, i32 3, i32 92, i32 45,
	i32 168, i32 72, i32 204, i32 182, i32 99, i32 130, i32 200, i32 134,
	i32 191, i32 213, i32 138, i32 87, i32 5, i32 179, i32 59, i32 43,
	i32 122, i32 159, i32 82, i32 156, i32 51, i32 4, i32 184, i32 219,
	i32 120, i32 190, i32 61, i32 50, i32 185, i32 137, i32 108, i32 102,
	i32 3, i32 146, i32 148, i32 9, i32 87, i32 69, i32 182, i32 18,
	i32 57, i32 93, i32 54, i32 71, i32 133, i32 48, i32 102, i32 48,
	i32 73, i32 112, i32 65, i32 52, i32 2, i32 152, i32 153, i32 28,
	i32 18, i32 14, i32 134, i32 124, i32 192, i32 11, i32 65, i32 159,
	i32 41, i32 57, i32 82, i32 116, i32 185, i32 62, i32 17, i32 27,
	i32 105, i32 64, i32 77, i32 7, i32 39, i32 135, i32 25, i32 4,
	i32 167, i32 17, i32 169, i32 131, i32 35, i32 145, i32 189, i32 94,
	i32 67, i32 170, i32 136, i32 118, i32 56, i32 88, i32 42, i32 107,
	i32 124, i32 89, i32 217, i32 33, i32 96, i32 98, i32 147, i32 29,
	i32 84, i32 63, i32 32, i32 204, i32 155, i32 60, i32 33, i32 41,
	i32 66, i32 55, i32 206, i32 150, i32 53, i32 122, i32 218, i32 134,
	i32 181, i32 110, i32 140, i32 196, i32 141, i32 9, i32 83, i32 196,
	i32 102, i32 209, i32 128, i32 75, i32 111, i32 10, i32 79, i32 23,
	i32 86, i32 22, i32 21, i32 149, i32 86, i32 144, i32 34, i32 151,
	i32 108, i32 51, i32 103, i32 201, i32 158, i32 1, i32 17, i32 151,
	i32 6, i32 13, i32 54, i32 136, i32 128, i32 38, i32 157, i32 37,
	i32 36, i32 113, i32 16, i32 49, i32 210, i32 194, i32 78, i32 76,
	i32 95, i32 42, i32 19, i32 139, i32 111, i32 107, i32 195, i32 208,
	i32 120, i32 114, i32 154, i32 16, i32 36, i32 138, i32 186, i32 39,
	i32 152, i32 191, i32 169, i32 195, i32 216, i32 116, i32 104, i32 77,
	i32 126, i32 106, i32 12, i32 80, i32 46, i32 71, i32 174, i32 160,
	i32 44, i32 5, i32 37, i32 157, i32 80, i32 185, i32 107, i32 143,
	i32 196, i32 214, i32 23, i32 203, i32 81, i32 19, i32 211, i32 135,
	i32 165, i32 133, i32 220, i32 170, i32 84, i32 109, i32 49, i32 26,
	i32 145, i32 202, i32 191, i32 68, i32 3, i32 72, i32 93, i32 98,
	i32 10, i32 0, i32 154, i32 205, i32 46, i32 207, i32 56, i32 146,
	i32 26, i32 219, i32 215, i32 125, i32 22, i32 15, i32 63, i32 61,
	i32 214, i32 131, i32 166, i32 186, i32 89, i32 160, i32 37, i32 119,
	i32 183, i32 127, i32 40, i32 97, i32 63, i32 90, i32 0, i32 137,
	i32 183, i32 158, i32 72, i32 95, i32 35, i32 127, i32 15, i32 152,
	i32 119, i32 81, i32 109, i32 135, i32 164, i32 112, i32 174, i32 172,
	i32 190, i32 198, i32 211, i32 130, i32 142, i32 28, i32 199, i32 20,
	i32 23, i32 40, i32 34, i32 202, i32 122, i32 123, i32 32, i32 164,
	i32 117, i32 76, i32 140, i32 173, i32 70, i32 60, i32 142, i32 180,
	i32 106, i32 93, i32 182, i32 192, i32 97, i32 172, i32 45, i32 171,
	i32 14, i32 44, i32 109, i32 116, i32 117, i32 42, i32 216, i32 46,
	i32 78, i32 35, i32 69, i32 43, i32 129, i32 30, i32 175, i32 64,
	i32 30, i32 210, i32 158, i32 199, i32 210, i32 124, i32 45, i32 188,
	i32 200, i32 32, i32 214, i32 64, i32 11, i32 96, i32 199, i32 100,
	i32 74, i32 193, i32 154, i32 66, i32 184, i32 76, i32 173, i32 165,
	i32 142, i32 164, i32 13, i32 126, i32 21, i32 84, i32 192, i32 12,
	i32 7, i32 187, i32 222, i32 143, i32 91, i32 147, i32 82, i32 39,
	i32 88, i32 166, i32 159, i32 113, i32 67, i32 207, i32 99, i32 197,
	i32 53, i32 178, i32 95, i32 6, i32 161, i32 139, i32 168, i32 51,
	i32 148, i32 19, i32 120, i32 217, i32 175, i32 151, i32 68, i32 205,
	i32 168, i32 100, i32 4, i32 169, i32 31, i32 75, i32 29, i32 177,
	i32 115, i32 211, i32 10, i32 47, i32 133, i32 165, i32 0, i32 206,
	i32 85, i32 60, i32 194, i32 160, i32 186, i32 112, i32 92, i32 104,
	i32 181, i32 198, i32 105, i32 61, i32 28
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 0ccdc57cf7fc59bd3f6cbf900c9cdbebadfe4609"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
