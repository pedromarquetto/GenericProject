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

@assembly_image_cache = dso_local local_unnamed_addr global [229 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [687 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 155
	i64 u0x0071cf2d27b7d61e, ; 1: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 118
	i64 u0x01109b0e4d99e61f, ; 2: System.ComponentModel.Annotations.dll => 138
	i64 u0x02123411c4e01926, ; 3: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 114
	i64 u0x02abedc11addc1ed, ; 4: lib_Mono.Android.Runtime.dll.so => 227
	i64 u0x032267b2a94db371, ; 5: lib_Xamarin.AndroidX.AppCompat.dll.so => 97
	i64 u0x033a1d0324ba06bd, ; 6: Microsoft.IO.RecyclableMemoryStream.dll => 49
	i64 u0x03602360ed7b65c0, ; 7: lib_ExtendedNumerics.BigDecimal.dll.so => 38
	i64 u0x03621c804933a890, ; 8: System.Buffers => 133
	i64 u0x0363ac97a4cb84e6, ; 9: SQLitePCLRaw.provider.e_sqlite3.dll => 90
	i64 u0x0399610510a38a38, ; 10: lib_System.Private.DataContractSerialization.dll.so => 177
	i64 u0x043032f1d071fae0, ; 11: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 12: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 13: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 14: System.Net.Primitives => 169
	i64 u0x051a3be159e4ef99, ; 15: Xamarin.GooglePlayServices.Tasks => 126
	i64 u0x0565d18c6da3de38, ; 16: Xamarin.AndroidX.RecyclerView => 116
	i64 u0x0581db89237110e9, ; 17: lib_System.Collections.dll.so => 137
	i64 u0x05989cb940b225a9, ; 18: Microsoft.Maui.dll => 52
	i64 u0x05a1c25e78e22d87, ; 19: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 185
	i64 u0x06076b5d2b581f08, ; 20: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x06388ffe9f6c161a, ; 21: System.Xml.Linq.dll => 218
	i64 u0x0680a433c781bb3d, ; 22: Xamarin.AndroidX.Collection.Jvm => 100
	i64 u0x069fff96ec92a91d, ; 23: System.Xml.XPath.dll => 221
	i64 u0x07c57877c7ba78ad, ; 24: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 25: System.Collections.NonGeneric => 135
	i64 u0x0835c05f84ea5da4, ; 26: lib_Microsoft.TeamFoundation.WorkItemTracking.Process.WebApi.dll.so => 68
	i64 u0x08a7c865576bbde7, ; 27: System.Reflection.Primitives => 183
	i64 u0x08f3c9788ee2153c, ; 28: Xamarin.AndroidX.DrawerLayout => 105
	i64 u0x09138715c92dba90, ; 29: lib_System.ComponentModel.Annotations.dll.so => 138
	i64 u0x0919c28b89381a0b, ; 30: lib_Microsoft.Extensions.Options.dll.so => 47
	i64 u0x092266563089ae3e, ; 31: lib_System.Collections.NonGeneric.dll.so => 135
	i64 u0x098b50f911ccea8d, ; 32: lib_Xamarin.GooglePlayServices.Basement.dll.so => 124
	i64 u0x09d144a7e214d457, ; 33: System.Security.Cryptography => 201
	i64 u0x0a980941fa112bc4, ; 34: System.Security.Cryptography.Xml => 95
	i64 u0x0abb3e2b271edc45, ; 35: System.Threading.Channels.dll => 209
	i64 u0x0b3b632c3bbee20c, ; 36: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 37: Xamarin.KotlinX.Serialization.Core.Jvm => 129
	i64 u0x0be2e1f8ce4064ed, ; 38: Xamarin.AndroidX.ViewPager => 120
	i64 u0x0c3ca6cc978e2aae, ; 39: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c537dededac91bc, ; 40: lib_Microsoft.Azure.DevOps.Comments.WebApi.dll.so => 57
	i64 u0x0c59ad9fbbd43abe, ; 41: Mono.Android => 228
	i64 u0x0c7790f60165fc06, ; 42: lib_Microsoft.Maui.Essentials.dll.so => 53
	i64 u0x0d12c8129f7dc6cf, ; 43: Microsoft.TeamFoundation.Wiki.WebApi.dll => 66
	i64 u0x0e14e73a54dda68e, ; 44: lib_System.Net.NameResolution.dll.so => 167
	i64 u0x0e6201d36109e73b, ; 45: Microsoft.TeamFoundation.DistributedTask.Common.Contracts.dll => 55
	i64 u0x0e847ae86f236751, ; 46: lib_NPOI.OpenXml4Net.dll.so => 79
	i64 u0x0e8481969601918b, ; 47: ICSharpCode.SharpZipLib.dll => 82
	i64 u0x102a31b45304b1da, ; 48: Xamarin.AndroidX.CustomView => 104
	i64 u0x10f6cfcbcf801616, ; 49: System.IO.Compression.Brotli => 156
	i64 u0x114443cdcf2091f1, ; 50: System.Security.Cryptography.Primitives => 199
	i64 u0x123639456fb056da, ; 51: System.Reflection.Emit.Lightweight.dll => 182
	i64 u0x125b7f94acb989db, ; 52: Xamarin.AndroidX.RecyclerView.dll => 116
	i64 u0x12e6ac3eb4ac01d6, ; 53: MS.TF.Pipelines.WebApi.NetStandard => 56
	i64 u0x13a01de0cbc3f06c, ; 54: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 55: lib_Java.Interop.dll.so => 226
	i64 u0x13f1e880c25d96d1, ; 56: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 57: Microsoft.Extensions.DependencyInjection.Abstractions => 44
	i64 u0x152a448bd1e745a7, ; 58: Microsoft.Win32.Primitives => 132
	i64 u0x15bdc156ed462f2f, ; 59: lib_System.IO.FileSystem.dll.so => 159
	i64 u0x16bf2a22df043a09, ; 60: System.IO.Pipes.dll => 161
	i64 u0x16ea2b318ad2d830, ; 61: System.Security.Cryptography.Algorithms => 196
	i64 u0x17125c9a85b4929f, ; 62: lib_netstandard.dll.so => 224
	i64 u0x17b56e25558a5d36, ; 63: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 64: System.Text.Encodings.Web => 206
	i64 u0x18402a709e357f3b, ; 65: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 129
	i64 u0x18a9befae51bb361, ; 66: System.Net.WebClient => 173
	i64 u0x18f0ce884e87d89a, ; 67: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x19a4c090f14ebb66, ; 68: System.Security.Claims => 195
	i64 u0x1a91866a319e9259, ; 69: lib_System.Collections.Concurrent.dll.so => 134
	i64 u0x1aac34d1917ba5d3, ; 70: lib_System.dll.so => 223
	i64 u0x1aad60783ffa3e5b, ; 71: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1bf2a5b665ffb0bf, ; 72: Microsoft.TeamFoundation.Work.WebApi => 67
	i64 u0x1c4e0224752e10d0, ; 73: lib_Microsoft.Azure.Pipelines.WebApi.dll.so => 58
	i64 u0x1c753b5ff15bce1b, ; 74: Mono.Android.Runtime.dll => 227
	i64 u0x1cd47467799d8250, ; 75: System.Threading.Tasks.dll => 211
	i64 u0x1e3d87657e9659bc, ; 76: Xamarin.AndroidX.Navigation.UI => 115
	i64 u0x1e71143913d56c10, ; 77: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1e7c31185e2fb266, ; 78: lib_System.Threading.Tasks.Parallel.dll.so => 210
	i64 u0x1ed8fcce5e9b50a0, ; 79: Microsoft.Extensions.Options.dll => 47
	i64 u0x1f055d15d807e1b2, ; 80: System.Xml.XmlSerializer => 222
	i64 u0x1f1db6c2c9fa7fcd, ; 81: Microsoft.TeamFoundation.Build2.WebApi => 59
	i64 u0x20237ea48006d7a8, ; 82: lib_System.Net.WebClient.dll.so => 173
	i64 u0x205f12e5ad0b1db8, ; 83: ExtendedNumerics.BigDecimal => 38
	i64 u0x209375905fcc1bad, ; 84: lib_System.IO.Compression.Brotli.dll.so => 156
	i64 u0x20fab3cf2dfbc8df, ; 85: lib_System.Diagnostics.Process.dll.so => 147
	i64 u0x2110167c128cba15, ; 86: System.Globalization => 155
	i64 u0x2174319c0d835bc9, ; 87: System.Runtime => 194
	i64 u0x21cc7e445dcd5469, ; 88: System.Reflection.Emit.ILGeneration => 181
	i64 u0x220fd4f2e7c48170, ; 89: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x224538d85ed15a82, ; 90: System.IO.Pipes => 161
	i64 u0x22908438c6bed1af, ; 91: lib_System.Threading.Timer.dll.so => 214
	i64 u0x2347c268e3e4e536, ; 92: Xamarin.GooglePlayServices.Basement.dll => 124
	i64 u0x237be844f1f812c7, ; 93: System.Threading.Thread.dll => 212
	i64 u0x23852b3bdc9f7096, ; 94: System.Resources.ResourceManager => 184
	i64 u0x2407aef2bbe8fadf, ; 95: System.Console => 143
	i64 u0x240abe014b27e7d3, ; 96: Xamarin.AndroidX.Core.dll => 102
	i64 u0x2420945b67c507aa, ; 97: Microsoft.Azure.Pipelines.WebApi => 58
	i64 u0x247619fe4413f8bf, ; 98: System.Runtime.Serialization.Primitives.dll => 193
	i64 u0x252073cc3caa62c2, ; 99: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x25a0a7eff76ea08e, ; 100: SQLitePCLRaw.batteries_v2.dll => 86
	i64 u0x2662c629b96b0b30, ; 101: lib_Xamarin.Kotlin.StdLib.dll.so => 127
	i64 u0x268c1439f13bcc29, ; 102: lib_Microsoft.Extensions.Primitives.dll.so => 48
	i64 u0x26d077d9678fe34f, ; 103: System.IO.dll => 162
	i64 u0x273f3515de5faf0d, ; 104: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 105: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x27b410442fad6cf1, ; 106: Java.Interop.dll => 226
	i64 u0x27b97e0d52c3034a, ; 107: System.Diagnostics.Debug => 145
	i64 u0x2801845a2c71fbfb, ; 108: System.Net.Primitives.dll => 169
	i64 u0x2a128783efe70ba0, ; 109: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 110: lib_System.Net.NetworkInformation.dll.so => 168
	i64 u0x2a6507a5ffabdf28, ; 111: System.Diagnostics.TraceSource.dll => 150
	i64 u0x2ad156c8e1354139, ; 112: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 113: System.Text.RegularExpressions.dll => 208
	i64 u0x2afc1c4f898552ee, ; 114: lib_System.Formats.Asn1.dll.so => 154
	i64 u0x2b148910ed40fbf9, ; 115: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2bc2c8499f169046, ; 116: SixLabors.ImageSharp => 84
	i64 u0x2c8bd14bb93a7d82, ; 117: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2cbd9262ca785540, ; 118: lib_System.Text.Encoding.CodePages.dll.so => 203
	i64 u0x2cc9e1fed6257257, ; 119: lib_System.Reflection.Emit.Lightweight.dll.so => 182
	i64 u0x2cd723e9fe623c7c, ; 120: lib_System.Private.Xml.Linq.dll.so => 179
	i64 u0x2d169d318a968379, ; 121: System.Threading.dll => 215
	i64 u0x2d47774b7d993f59, ; 122: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2d9c22e6e269f657, ; 123: lib_Microsoft.VisualStudio.Services.Common.dll.so => 73
	i64 u0x2db915caf23548d2, ; 124: System.Text.Json.dll => 207
	i64 u0x2dc0101b251f3d48, ; 125: Microsoft.VisualStudio.Services.WebApi.dll => 74
	i64 u0x2e5a40c319acb800, ; 126: System.IO.FileSystem => 159
	i64 u0x2e6f1f226821322a, ; 127: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f02f94df3200fe5, ; 128: System.Diagnostics.Process => 147
	i64 u0x2f2e98e1c89b1aff, ; 129: System.Xml.ReaderWriter => 219
	i64 u0x2f5911d9ba814e4e, ; 130: System.Diagnostics.Tracing => 151
	i64 u0x309ee9eeec09a71e, ; 131: lib_Xamarin.AndroidX.Fragment.dll.so => 106
	i64 u0x31195fef5d8fb552, ; 132: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x31be47543be3ce1f, ; 133: lib_Microsoft.VisualStudio.Services.TestManagement.TestPlanning.WebApi.dll.so => 70
	i64 u0x32243413e774362a, ; 134: Xamarin.AndroidX.CardView.dll => 99
	i64 u0x3235427f8d12dae1, ; 135: lib_System.Drawing.Primitives.dll.so => 152
	i64 u0x329753a17a517811, ; 136: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 137: lib_System.Xml.ReaderWriter.dll.so => 219
	i64 u0x3375ce28502b434e, ; 138: NPOI.Core.dll => 77
	i64 u0x33a31443733849fe, ; 139: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 140: lib_System.Net.Sockets.dll.so => 172
	i64 u0x34dfd74fe2afcf37, ; 141: Microsoft.Maui => 52
	i64 u0x34e292762d9615df, ; 142: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 143: Microsoft.Maui.Controls => 50
	i64 u0x353590da528c9d22, ; 144: System.ComponentModel.Annotations => 138
	i64 u0x3549870798b4cd30, ; 145: lib_Xamarin.AndroidX.ViewPager2.dll.so => 121
	i64 u0x355282fc1c909694, ; 146: Microsoft.Extensions.Configuration => 41
	i64 u0x355c649948d55d97, ; 147: lib_System.Runtime.Intrinsics.dll.so => 189
	i64 u0x359882f8387518bd, ; 148: Microsoft.VisualStudio.Services.TestManagement.TestPlanning.WebApi.dll => 70
	i64 u0x3628ab68db23a01a, ; 149: lib_System.Diagnostics.Tools.dll.so => 149
	i64 u0x3673b042508f5b6b, ; 150: lib_System.Runtime.Extensions.dll.so => 186
	i64 u0x36b2b50fdf589ae2, ; 151: System.Reflection.Emit.Lightweight => 182
	i64 u0x374ef46b06791af6, ; 152: System.Reflection.Primitives.dll => 183
	i64 u0x37bc29f3183003b6, ; 153: lib_System.IO.dll.so => 162
	i64 u0x38049b5c59b39324, ; 154: System.Runtime.CompilerServices.Unsafe => 185
	i64 u0x385c17636bb6fe6e, ; 155: Xamarin.AndroidX.CustomView.dll => 104
	i64 u0x38869c811d74050e, ; 156: System.Net.NameResolution.dll => 167
	i64 u0x3889cbdca0f2c57c, ; 157: Xamarin.GooglePlayServices.Location.dll => 125
	i64 u0x39251dccb84bdcaa, ; 158: lib_System.Configuration.ConfigurationManager.dll.so => 92
	i64 u0x393c226616977fdb, ; 159: lib_Xamarin.AndroidX.ViewPager.dll.so => 120
	i64 u0x395e37c3334cf82a, ; 160: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x39aa39fda111d9d3, ; 161: Newtonsoft.Json => 75
	i64 u0x3a6cc111856de066, ; 162: Microsoft.VisualStudio.Services.Common => 73
	i64 u0x3aacf90d24604f9d, ; 163: SQLitePCLRaw.provider.sqlite3.dll => 91
	i64 u0x3ab5859054645f72, ; 164: System.Security.Cryptography.Primitives.dll => 199
	i64 u0x3b6894af158dd739, ; 165: System.Net.Http.Formatting => 40
	i64 u0x3b860f9932505633, ; 166: lib_System.Text.Encoding.Extensions.dll.so => 204
	i64 u0x3c3aafb6b3a00bf6, ; 167: lib_System.Security.Cryptography.X509Certificates.dll.so => 200
	i64 u0x3c7c495f58ac5ee9, ; 168: Xamarin.Kotlin.StdLib => 127
	i64 u0x3d196e782ed8c01a, ; 169: System.Data.SqlClient => 93
	i64 u0x3d2b1913edfc08d7, ; 170: lib_System.Threading.ThreadPool.dll.so => 213
	i64 u0x3d46f0b995082740, ; 171: System.Xml.Linq => 218
	i64 u0x3d9c2a242b040a50, ; 172: lib_Xamarin.AndroidX.Core.dll.so => 102
	i64 u0x3da7781d6333a8fe, ; 173: SQLitePCLRaw.batteries_v2 => 86
	i64 u0x3fc2b7b87a164cbc, ; 174: Microsoft.TeamFoundation.DistributedTask.Common.Contracts => 55
	i64 u0x407a10bb4bf95829, ; 175: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 112
	i64 u0x415e36f6b13ff6f3, ; 176: System.Configuration.ConfigurationManager.dll => 92
	i64 u0x41cab042be111c34, ; 177: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 98
	i64 u0x41f96d72dd6b57de, ; 178: Microsoft.TeamFoundation.Policy.WebApi.dll => 62
	i64 u0x423a9ecc4d905a88, ; 179: lib_System.Resources.ResourceManager.dll.so => 184
	i64 u0x423bf51ae7def810, ; 180: System.Xml.XPath => 221
	i64 u0x42761d41773a05db, ; 181: lib_NPOI.OOXML.dll.so => 78
	i64 u0x43375950ec7c1b6a, ; 182: netstandard.dll => 224
	i64 u0x434c4e1d9284cdae, ; 183: Mono.Android.dll => 228
	i64 u0x43950f84de7cc79a, ; 184: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x448bd33429269b19, ; 185: Microsoft.CSharp => 131
	i64 u0x4499fa3c8e494654, ; 186: lib_System.Runtime.Serialization.Primitives.dll.so => 193
	i64 u0x4515080865a951a5, ; 187: Xamarin.Kotlin.StdLib.dll => 127
	i64 u0x45c40276a42e283e, ; 188: System.Diagnostics.TraceSource => 150
	i64 u0x463d680a1dec0810, ; 189: System.Security.Cryptography.Xml.dll => 95
	i64 u0x46a4213bc97fe5ae, ; 190: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x472c10e45b4b6f81, ; 191: SixLabors.ImageSharp.dll => 84
	i64 u0x47358bd471172e1d, ; 192: lib_System.Xml.Linq.dll.so => 218
	i64 u0x47daf4e1afbada10, ; 193: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 194: System.ObjectModel => 176
	i64 u0x49f9e6948a8131e4, ; 195: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 119
	i64 u0x4a5667b2462a664b, ; 196: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 115
	i64 u0x4b07a0ed0ab33ff4, ; 197: System.Runtime.Extensions.dll => 186
	i64 u0x4b7b6532ded934b7, ; 198: System.Text.Json => 207
	i64 u0x4bb183a647a35f4e, ; 199: lib_Microsoft.TeamFoundation.Build2.WebApi.dll.so => 59
	i64 u0x4cc5f15266470798, ; 200: lib_Xamarin.AndroidX.Loader.dll.so => 111
	i64 u0x4cf6f67dc77aacd2, ; 201: System.Net.NetworkInformation.dll => 168
	i64 u0x4d479f968a05e504, ; 202: System.Linq.Expressions.dll => 163
	i64 u0x4d55a010ffc4faff, ; 203: System.Private.Xml => 180
	i64 u0x4d95fccc1f67c7ca, ; 204: System.Runtime.Loader.dll => 190
	i64 u0x4dcf44c3c9b076a2, ; 205: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 206: Xamarin.AndroidX.Loader.dll => 111
	i64 u0x4e32f00cb0937401, ; 207: Mono.Android.Runtime => 227
	i64 u0x4e5eea4668ac2b18, ; 208: System.Text.Encoding.CodePages => 203
	i64 u0x4ebd0c4b82c5eefc, ; 209: lib_System.Threading.Channels.dll.so => 209
	i64 u0x4f21ee6ef9eb527e, ; 210: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x4fd5f3ee53d0a4f0, ; 211: SQLitePCLRaw.lib.e_sqlite3.android => 88
	i64 u0x4fdbea8683929d35, ; 212: Microsoft.TeamFoundation.WorkItemTracking.WebApi => 69
	i64 u0x5037f0be3c28c7a3, ; 213: lib_Microsoft.Maui.Controls.dll.so => 50
	i64 u0x5112ed116d87baf8, ; 214: CommunityToolkit.Mvvm => 36
	i64 u0x51165dc3c0e10163, ; 215: Microsoft.TeamFoundation.TestManagement.WebApi => 65
	i64 u0x5131bbe80989093f, ; 216: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 109
	i64 u0x51bb8a2afe774e32, ; 217: System.Drawing => 153
	i64 u0x526ce79eb8e90527, ; 218: lib_System.Net.Primitives.dll.so => 169
	i64 u0x52829f00b4467c38, ; 219: lib_System.Data.Common.dll.so => 144
	i64 u0x529ffe06f39ab8db, ; 220: Xamarin.AndroidX.Core => 102
	i64 u0x52d01bc91d6d5848, ; 221: lib_SQLitePCLRaw.provider.sqlite3.dll.so => 91
	i64 u0x52ff996554dbf352, ; 222: Microsoft.Maui.Graphics => 54
	i64 u0x535f7e40e8fef8af, ; 223: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53a96d5c86c9e194, ; 224: System.Net.NetworkInformation => 168
	i64 u0x53be1038a61e8d44, ; 225: System.Runtime.InteropServices.RuntimeInformation.dll => 187
	i64 u0x53c3014b9437e684, ; 226: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x541ce529de288d81, ; 227: Microsoft.Azure.Pipelines.WebApi.dll => 58
	i64 u0x5435e6f049e9bc37, ; 228: System.Security.Claims.dll => 195
	i64 u0x54795225dd1587af, ; 229: lib_System.Runtime.dll.so => 194
	i64 u0x55250ba592fd51e2, ; 230: SQLitePCLRaw.provider.dynamic_cdecl.dll => 89
	i64 u0x556e8b63b660ab8b, ; 231: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 107
	i64 u0x5588627c9a108ec9, ; 232: System.Collections.Specialized => 136
	i64 u0x55c27c746f550e7f, ; 233: lib_NPOI.OpenXmlFormats.dll.so => 80
	i64 u0x571c5cfbec5ae8e2, ; 234: System.Private.Uri => 178
	i64 u0x578cd35c91d7b347, ; 235: lib_SQLitePCLRaw.core.dll.so => 87
	i64 u0x579a06fed6eec900, ; 236: System.Private.CoreLib.dll => 225
	i64 u0x57c542c14049b66d, ; 237: System.Diagnostics.DiagnosticSource => 146
	i64 u0x57edc7adad611bc0, ; 238: lib_Microsoft.VisualStudio.Services.TestResults.WebApi.dll.so => 71
	i64 u0x581a8bd5cfda563e, ; 239: System.Threading.Timer => 214
	i64 u0x582ff48bae35f9cc, ; 240: Microsoft.TeamFoundation.Policy.WebApi => 62
	i64 u0x58601b2dda4a27b9, ; 241: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 242: Microsoft.Extensions.DependencyInjection.dll => 43
	i64 u0x59430ff1a3060449, ; 243: lib_Microsoft.VisualStudio.Services.WebApi.dll.so => 74
	i64 u0x595a356d23e8da9a, ; 244: lib_Microsoft.CSharp.dll.so => 131
	i64 u0x5a0f9bb5b4d6200c, ; 245: NPOI.OpenXml4Net => 79
	i64 u0x5a89a886ae30258d, ; 246: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 101
	i64 u0x5a8f6699f4a1caa9, ; 247: lib_System.Threading.dll.so => 215
	i64 u0x5ae9cd33b15841bf, ; 248: System.ComponentModel => 142
	i64 u0x5b54391bdc6fcfe6, ; 249: System.Private.DataContractSerialization => 177
	i64 u0x5b5f0e240a06a2a2, ; 250: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5b755276902c8414, ; 251: Xamarin.GooglePlayServices.Base => 123
	i64 u0x5bf46332cc09e9b2, ; 252: lib_System.Data.SqlClient.dll.so => 93
	i64 u0x5c393624b8176517, ; 253: lib_Microsoft.Extensions.Logging.dll.so => 45
	i64 u0x5d0a4a29b02d9d3c, ; 254: System.Net.WebHeaderCollection.dll => 174
	i64 u0x5d3619fbfe8a8b84, ; 255: Microsoft.TeamFoundation.Common.dll => 72
	i64 u0x5d7ec76c1c703055, ; 256: System.Threading.Tasks.Parallel => 210
	i64 u0x5db0cbbd1028510e, ; 257: lib_System.Runtime.InteropServices.dll.so => 188
	i64 u0x5db30905d3e5013b, ; 258: Xamarin.AndroidX.Collection.Jvm.dll => 100
	i64 u0x5e467bc8f09ad026, ; 259: System.Collections.Specialized.dll => 136
	i64 u0x5ea92fdb19ec8c4c, ; 260: System.Text.Encodings.Web.dll => 206
	i64 u0x5eb8046dd40e9ac3, ; 261: System.ComponentModel.Primitives => 140
	i64 u0x5ec272d219c9aba4, ; 262: System.Security.Cryptography.Csp.dll => 197
	i64 u0x5f36ccf5c6a57e24, ; 263: System.Xml.ReaderWriter.dll => 219
	i64 u0x5f4294b9b63cb842, ; 264: System.Data.Common => 144
	i64 u0x5f7399e166075632, ; 265: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 88
	i64 u0x5f9a2d823f664957, ; 266: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x5fac98e0b37a5b9d, ; 267: System.Runtime.CompilerServices.Unsafe.dll => 185
	i64 u0x5fdf89780c783642, ; 268: Microsoft.TeamFoundation.Build2.WebApi.dll => 59
	i64 u0x609f4b7b63d802d4, ; 269: lib_Microsoft.Extensions.DependencyInjection.dll.so => 43
	i64 u0x60cd4e33d7e60134, ; 270: Xamarin.KotlinX.Coroutines.Core.Jvm => 128
	i64 u0x60f62d786afcf130, ; 271: System.Memory => 165
	i64 u0x61a3b9f0f15a3269, ; 272: lib_SixLabors.Fonts.dll.so => 83
	i64 u0x61bb78c89f867353, ; 273: System.IO => 162
	i64 u0x61be8d1299194243, ; 274: Microsoft.Maui.Controls.Xaml => 51
	i64 u0x61d2cba29557038f, ; 275: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 276: lib_System.Runtime.Loader.dll.so => 190
	i64 u0x622eef6f9e59068d, ; 277: System.Private.CoreLib => 225
	i64 u0x6400f68068c1e9f1, ; 278: Xamarin.Google.Android.Material.dll => 122
	i64 u0x640e3b14dbd325c2, ; 279: System.Security.Cryptography.Algorithms.dll => 196
	i64 u0x64ef1e444631e514, ; 280: lib_Microsoft.TeamFoundation.Dashboards.WebApi.dll.so => 61
	i64 u0x65ecac39144dd3cc, ; 281: Microsoft.Maui.Controls.dll => 50
	i64 u0x65ece51227bfa724, ; 282: lib_System.Runtime.Numerics.dll.so => 191
	i64 u0x6692e924eade1b29, ; 283: lib_System.Console.dll.so => 143
	i64 u0x66a4e5c6a3fb0bae, ; 284: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 109
	i64 u0x66d13304ce1a3efa, ; 285: Xamarin.AndroidX.CursorAdapter => 103
	i64 u0x68558ec653afa616, ; 286: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x6872ec7a2e36b1ac, ; 287: System.Drawing.Primitives.dll => 152
	i64 u0x68fbbbe2eb455198, ; 288: System.Formats.Asn1 => 154
	i64 u0x69063fc0ba8e6bdd, ; 289: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x699dffb2427a2d71, ; 290: SQLitePCLRaw.lib.e_sqlite3.android.dll => 88
	i64 u0x69d222aa41880d8a, ; 291: Microsoft.TeamFoundation.WorkItemTracking.WebApi.dll => 69
	i64 u0x6a4d7577b2317255, ; 292: System.Runtime.InteropServices.dll => 188
	i64 u0x6ace3b74b15ee4a4, ; 293: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6b72e812178e0d2c, ; 294: Microsoft.Azure.DevOps.Comments.WebApi => 57
	i64 u0x6d0a12b2adba20d8, ; 295: System.Security.Cryptography.ProtectedData.dll => 94
	i64 u0x6d12bfaa99c72b1f, ; 296: lib_Microsoft.Maui.Graphics.dll.so => 54
	i64 u0x6d593753d43dea6d, ; 297: Microsoft.VisualStudio.Services.TestResults.WebApi.dll => 71
	i64 u0x6d70755158ca866e, ; 298: lib_System.ComponentModel.EventBasedAsync.dll.so => 139
	i64 u0x6d79993361e10ef2, ; 299: Microsoft.Extensions.Primitives => 48
	i64 u0x6d86d56b84c8eb71, ; 300: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 103
	i64 u0x6d9bea6b3e895cf7, ; 301: Microsoft.Extensions.Primitives.dll => 48
	i64 u0x6de66846b004f453, ; 302: Microsoft.VisualStudio.Services.Common.dll => 73
	i64 u0x6e25a02c3833319a, ; 303: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 113
	i64 u0x6ef94afcdd730353, ; 304: Microsoft.TeamFoundation.TestManagement.WebApi.dll => 65
	i64 u0x6fd2265da78b93a4, ; 305: lib_Microsoft.Maui.dll.so => 52
	i64 u0x6fdfc7de82c33008, ; 306: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x6ffc4967cc47ba57, ; 307: System.IO.FileSystem.Watcher.dll => 158
	i64 u0x701cd46a1c25a5fe, ; 308: System.IO.FileSystem.dll => 159
	i64 u0x70e99f48c05cb921, ; 309: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 310: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 311: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 312: System.ComponentModel.Primitives.dll => 140
	i64 u0x71fb77e68dfe8984, ; 313: GenericMaui.dll => 130
	i64 u0x725f5a9e82a45c81, ; 314: System.Security.Cryptography.Encoding => 198
	i64 u0x72b1fb4109e08d7b, ; 315: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x7335564626169482, ; 316: lib_Microsoft.TeamFoundation.TestManagement.WebApi.dll.so => 65
	i64 u0x73e4ce94e2eb6ffc, ; 317: lib_System.Memory.dll.so => 165
	i64 u0x74fcb5b9d3ee6884, ; 318: Plugin.LocalNotification => 81
	i64 u0x755a91767330b3d4, ; 319: lib_Microsoft.Extensions.Configuration.dll.so => 41
	i64 u0x75b7771d8e6703e2, ; 320: Microsoft.Azure.DevOps.Comments.WebApi.dll => 57
	i64 u0x75f59536ad2b55b1, ; 321: SixLabors.Fonts => 83
	i64 u0x76012e7334db86e5, ; 322: lib_Xamarin.AndroidX.SavedState.dll.so => 117
	i64 u0x76ca07b878f44da0, ; 323: System.Runtime.Numerics.dll => 191
	i64 u0x76e7fae0f3c76066, ; 324: lib_Microsoft.TeamFoundation.Policy.WebApi.dll.so => 62
	i64 u0x780bc73597a503a9, ; 325: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 326: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 327: Xamarin.AndroidX.Fragment.dll => 106
	i64 u0x7a090e7cbb6c0ed1, ; 328: Xamarin.GooglePlayServices.Location => 125
	i64 u0x7a14a9cb254b8464, ; 329: Microsoft.TeamFoundation.Test.WebApi => 64
	i64 u0x7a67b8a270b82e7e, ; 330: lib_NPOI.Core.dll.so => 77
	i64 u0x7adb8da2ac89b647, ; 331: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7bcebf0eb1ed3948, ; 332: lib_MathNet.Numerics.dll.so => 39
	i64 u0x7bef86a4335c4870, ; 333: System.ComponentModel.TypeConverter => 141
	i64 u0x7c0820144cd34d6a, ; 334: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 335: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7c41d387501568ba, ; 336: System.Net.WebClient.dll => 173
	i64 u0x7cb95ad2a929d044, ; 337: Xamarin.GooglePlayServices.Basement => 124
	i64 u0x7d649b75d580bb42, ; 338: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 339: System.Numerics.Vectors => 175
	i64 u0x7dfc3d6d9d8d7b70, ; 340: System.Collections => 137
	i64 u0x7e1f8f575a3599cb, ; 341: BouncyCastle.Cryptography.dll => 35
	i64 u0x7e2e564fa2f76c65, ; 342: lib_System.Diagnostics.Tracing.dll.so => 151
	i64 u0x7e302e110e1e1346, ; 343: lib_System.Security.Claims.dll.so => 195
	i64 u0x7e4084a672f9c30e, ; 344: lib_System.Security.Cryptography.Xml.dll.so => 95
	i64 u0x7e4b37f13694af03, ; 345: lib_Microsoft.TeamFoundation.Work.WebApi.dll.so => 67
	i64 u0x7e946809d6008ef2, ; 346: lib_System.ObjectModel.dll.so => 176
	i64 u0x7eb4f0dc47488736, ; 347: lib_Xamarin.GooglePlayServices.Tasks.dll.so => 126
	i64 u0x7ecc13347c8fd849, ; 348: lib_System.ComponentModel.dll.so => 142
	i64 u0x7f00ddd9b9ca5a13, ; 349: Xamarin.AndroidX.ViewPager.dll => 120
	i64 u0x7f44178d8ba8c375, ; 350: MS.TF.Pipelines.WebApi.NetStandard.dll => 56
	i64 u0x7f903af8afd7c6c3, ; 351: lib_SQLitePCLRaw.provider.dynamic_cdecl.dll.so => 89
	i64 u0x7f9351cd44b1273f, ; 352: Microsoft.Extensions.Configuration.Abstractions => 42
	i64 u0x7fbd557c99b3ce6f, ; 353: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 108
	i64 u0x8078c12ab831fadc, ; 354: lib_GenericMaui.dll.so => 130
	i64 u0x80fa55b6d1b0be99, ; 355: SQLitePCLRaw.provider.e_sqlite3 => 90
	i64 u0x812c069d5cdecc17, ; 356: System.dll => 223
	i64 u0x81ab745f6c0f5ce6, ; 357: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8277f2be6b5ce05f, ; 358: Xamarin.AndroidX.AppCompat => 97
	i64 u0x828f06563b30bc50, ; 359: lib_Xamarin.AndroidX.CardView.dll.so => 99
	i64 u0x82df8f5532a10c59, ; 360: lib_System.Drawing.dll.so => 153
	i64 u0x82f6403342e12049, ; 361: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83144699b312ad81, ; 362: SQLite-net.dll => 85
	i64 u0x837b40a260a811d5, ; 363: lib_Microsoft.TeamFoundation.SourceControl.WebApi.dll.so => 63
	i64 u0x83c14ba66c8e2b8c, ; 364: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x846ce984efea52c7, ; 365: System.Threading.Tasks.Parallel.dll => 210
	i64 u0x84ae73148a4557d2, ; 366: lib_System.IO.Pipes.dll.so => 161
	i64 u0x84d526f04582b100, ; 367: Microsoft.TeamFoundation.Core.WebApi.dll => 60
	i64 u0x86a909228dc7657b, ; 368: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 369: Microsoft.Extensions.Configuration.dll => 41
	i64 u0x8702a8575d9d19bd, ; 370: Microsoft.TeamFoundation.Wiki.WebApi => 66
	i64 u0x8738d9ebac619256, ; 371: lib_Microsoft.TeamFoundation.DistributedTask.Common.Contracts.dll.so => 55
	i64 u0x87c69b87d9283884, ; 372: lib_System.Threading.Thread.dll.so => 212
	i64 u0x87f6569b25707834, ; 373: System.IO.Compression.Brotli.dll => 156
	i64 u0x8842b3a5d2d3fb36, ; 374: Microsoft.Maui.Essentials => 53
	i64 u0x88bda98e0cffb7a9, ; 375: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 128
	i64 u0x8930322c7bd8f768, ; 376: netstandard => 224
	i64 u0x897a606c9e39c75f, ; 377: lib_System.ComponentModel.Primitives.dll.so => 140
	i64 u0x89c5188089ec2cd5, ; 378: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 187
	i64 u0x8ad229ea26432ee2, ; 379: Xamarin.AndroidX.Loader => 111
	i64 u0x8b4ff5d0fdd5faa1, ; 380: lib_System.Diagnostics.DiagnosticSource.dll.so => 146
	i64 u0x8b541d476eb3774c, ; 381: System.Security.Principal.Windows => 202
	i64 u0x8b8d01333a96d0b5, ; 382: System.Diagnostics.Process.dll => 147
	i64 u0x8b9ceca7acae3451, ; 383: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8c4e8fc055a910fb, ; 384: lib_SixLabors.ImageSharp.dll.so => 84
	i64 u0x8cdfdb4ce85fb925, ; 385: lib_System.Security.Principal.Windows.dll.so => 202
	i64 u0x8d0f420977c2c1c7, ; 386: Xamarin.AndroidX.CursorAdapter.dll => 103
	i64 u0x8d7b8ab4b3310ead, ; 387: System.Threading => 215
	i64 u0x8da188285aadfe8e, ; 388: System.Collections.Concurrent => 134
	i64 u0x8ec6e06a61c1baeb, ; 389: lib_Newtonsoft.Json.dll.so => 75
	i64 u0x8ed807bfe9858dfc, ; 390: Xamarin.AndroidX.Navigation.Common => 112
	i64 u0x8ee08b8194a30f48, ; 391: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef5a41ebe9f5b40, ; 392: NPOI.OpenXml4Net.dll => 79
	i64 u0x8ef7601039857a44, ; 393: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8ef9414937d93a0a, ; 394: SQLitePCLRaw.core.dll => 87
	i64 u0x8efbc0801a122264, ; 395: Xamarin.GooglePlayServices.Tasks.dll => 126
	i64 u0x8f32c6f611f6ffab, ; 396: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 397: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x8fbf5b0114c6dcef, ; 398: System.Globalization.dll => 155
	i64 u0x8fd27d934d7b3a55, ; 399: SQLitePCLRaw.core => 87
	i64 u0x90263f8448b8f572, ; 400: lib_System.Diagnostics.TraceSource.dll.so => 150
	i64 u0x903101b46fb73a04, ; 401: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 402: lib_System.IO.Compression.dll.so => 157
	i64 u0x90634f86c5ebe2b5, ; 403: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 109
	i64 u0x907b636704ad79ef, ; 404: lib_Microsoft.Maui.Controls.Xaml.dll.so => 51
	i64 u0x91418dc638b29e68, ; 405: lib_Xamarin.AndroidX.CustomView.dll.so => 104
	i64 u0x9157bd523cd7ed36, ; 406: lib_System.Text.Json.dll.so => 207
	i64 u0x91a74f07b30d37e2, ; 407: System.Linq.dll => 164
	i64 u0x91fa41a87223399f, ; 408: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 409: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 410: System.IO.Compression.dll => 157
	i64 u0x967fc325e09bfa8c, ; 411: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 412: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 413: Microsoft.Maui.Graphics.dll => 54
	i64 u0x979ab54025cc1c7f, ; 414: lib_Xamarin.GooglePlayServices.Base.dll.so => 123
	i64 u0x97b8c771ea3e4220, ; 415: System.ComponentModel.dll => 142
	i64 u0x97e144c9d3c6976e, ; 416: System.Collections.Concurrent.dll => 134
	i64 u0x98d70883c4beabde, ; 417: ExtendedNumerics.BigDecimal.dll => 38
	i64 u0x991d510397f92d9d, ; 418: System.Linq.Expressions => 163
	i64 u0x99848297d0d6a913, ; 419: Enums.NET => 37
	i64 u0x999cb19e1a04ffd3, ; 420: CommunityToolkit.Mvvm.dll => 36
	i64 u0x99a00ca5270c6878, ; 421: Xamarin.AndroidX.Navigation.Runtime => 114
	i64 u0x99cdc6d1f2d3a72f, ; 422: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9a816d9654deff7c, ; 423: Microsoft.IO.RecyclableMemoryStream => 49
	i64 u0x9b211a749105beac, ; 424: System.Transactions.Local => 216
	i64 u0x9c244ac7cda32d26, ; 425: System.Security.Cryptography.X509Certificates.dll => 200
	i64 u0x9c8dec1a04bba721, ; 426: NPOI.OOXML.dll => 78
	i64 u0x9c9ac1d95198ac57, ; 427: Newtonsoft.Json.Bson.dll => 76
	i64 u0x9d5dbcf5a48583fe, ; 428: lib_Xamarin.AndroidX.Activity.dll.so => 96
	i64 u0x9d74dee1a7725f34, ; 429: Microsoft.Extensions.Configuration.Abstractions.dll => 42
	i64 u0x9e4534b6adaf6e84, ; 430: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9e4b95dec42769f7, ; 431: System.Diagnostics.Debug.dll => 145
	i64 u0x9eaf1efdf6f7267e, ; 432: Xamarin.AndroidX.Navigation.Common.dll => 112
	i64 u0x9ef542cf1f78c506, ; 433: Xamarin.AndroidX.Lifecycle.LiveData.Core => 108
	i64 u0x9fc2184212c417ad, ; 434: Plugin.LocalNotification.dll => 81
	i64 u0xa0d8259f4cc284ec, ; 435: lib_System.Security.Cryptography.dll.so => 201
	i64 u0xa12fbfb4da97d9f3, ; 436: System.Threading.Timer.dll => 214
	i64 u0xa1440773ee9d341e, ; 437: Xamarin.Google.Android.Material => 122
	i64 u0xa1b9d7c27f47219f, ; 438: Xamarin.AndroidX.Navigation.UI.dll => 115
	i64 u0xa2572680829d2c7c, ; 439: System.IO.Pipelines.dll => 160
	i64 u0xa46aa1eaa214539b, ; 440: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa4d20d2ff0563d26, ; 441: lib_CommunityToolkit.Mvvm.dll.so => 36
	i64 u0xa4edc8f2ceae241a, ; 442: System.Data.Common.dll => 144
	i64 u0xa5494f40f128ce6a, ; 443: System.Runtime.Serialization.Formatters.dll => 192
	i64 u0xa5634375ded68ca4, ; 444: MathNet.Numerics.dll => 39
	i64 u0xa5b7152421ed6d98, ; 445: lib_System.IO.FileSystem.Watcher.dll.so => 158
	i64 u0xa5ce5c755bde8cb8, ; 446: lib_System.Security.Cryptography.Csp.dll.so => 197
	i64 u0xa5e599d1e0524750, ; 447: System.Numerics.Vectors.dll => 175
	i64 u0xa5f1ba49b85dd355, ; 448: System.Security.Cryptography.dll => 201
	i64 u0xa61975a5a37873ea, ; 449: lib_System.Xml.XmlSerializer.dll.so => 222
	i64 u0xa67dbee13e1df9ca, ; 450: Xamarin.AndroidX.SavedState.dll => 117
	i64 u0xa68a420042bb9b1f, ; 451: Xamarin.AndroidX.DrawerLayout.dll => 105
	i64 u0xa72660a373f4abc3, ; 452: NPOI.Core => 77
	i64 u0xa763fbb98df8d9fb, ; 453: lib_Microsoft.Win32.Primitives.dll.so => 132
	i64 u0xa78ce3745383236a, ; 454: Xamarin.AndroidX.Lifecycle.Common.Jvm => 107
	i64 u0xa7c31b56b4dc7b33, ; 455: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa7eb6bbeaebf5a8d, ; 456: NPOI.OpenXmlFormats.dll => 80
	i64 u0xa843f6095f0d247d, ; 457: Xamarin.GooglePlayServices.Base.dll => 123
	i64 u0xaa2219c8e3449ff5, ; 458: Microsoft.Extensions.Logging.Abstractions => 46
	i64 u0xaa36c6439964ed3c, ; 459: Microsoft.VisualStudio.Services.TestResults.WebApi => 71
	i64 u0xaa443ac34067eeef, ; 460: System.Private.Xml.dll => 180
	i64 u0xaa52de307ef5d1dd, ; 461: System.Net.Http => 166
	i64 u0xaaaf86367285a918, ; 462: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 44
	i64 u0xaaf84bb3f052a265, ; 463: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab419331254b1e6e, ; 464: Enums.NET.dll => 37
	i64 u0xab9c1b2687d86b0b, ; 465: lib_System.Linq.Expressions.dll.so => 163
	i64 u0xabfe4d78f1af882a, ; 466: NPOI.OpenXmlFormats => 80
	i64 u0xac2af3fa195a15ce, ; 467: System.Runtime.Numerics => 191
	i64 u0xac5376a2a538dc10, ; 468: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 108
	i64 u0xac5acae88f60357e, ; 469: System.Diagnostics.Tools.dll => 149
	i64 u0xac79c7e46047ad98, ; 470: System.Security.Principal.Windows.dll => 202
	i64 u0xac98d31068e24591, ; 471: System.Xml.XDocument => 220
	i64 u0xacd46e002c3ccb97, ; 472: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 473: System.Threading.Channels => 209
	i64 u0xad53b38782fb1a3d, ; 474: ICSharpCode.SharpZipLib => 82
	i64 u0xad89c07347f1bad6, ; 475: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 476: System.Web.HttpUtility => 217
	i64 u0xadc90ab061a9e6e4, ; 477: System.ComponentModel.TypeConverter.dll => 141
	i64 u0xadf511667bef3595, ; 478: System.Net.Security => 171
	i64 u0xae0aaa94fdcfce0f, ; 479: System.ComponentModel.EventBasedAsync.dll => 139
	i64 u0xae282bcd03739de7, ; 480: Java.Interop => 226
	i64 u0xae53579c90db1107, ; 481: System.ObjectModel.dll => 176
	i64 u0xae7ea18c61eef394, ; 482: SQLite-net => 85
	i64 u0xafe29f45095518e7, ; 483: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 110
	i64 u0xb05b6f0a6cc8ddbb, ; 484: lib_Microsoft.IO.RecyclableMemoryStream.dll.so => 49
	i64 u0xb05cc42cd94c6d9d, ; 485: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb0bb43dc52ea59f9, ; 486: System.Diagnostics.Tracing.dll => 151
	i64 u0xb220631954820169, ; 487: System.Text.RegularExpressions => 208
	i64 u0xb2376e1dbf8b4ed7, ; 488: System.Security.Cryptography.Csp => 197
	i64 u0xb2602c583b0f5a70, ; 489: Microsoft.TeamFoundation.WorkItemTracking.Process.WebApi => 68
	i64 u0xb2a3f67f3bf29fce, ; 490: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb3946bc8a192ef06, ; 491: Microsoft.TeamFoundation.Common => 72
	i64 u0xb398860d6ed7ba2f, ; 492: System.Security.Cryptography.ProtectedData => 94
	i64 u0xb3f0a0fcda8d3ebc, ; 493: Xamarin.AndroidX.CardView => 99
	i64 u0xb46be1aa6d4fff93, ; 494: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 495: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 496: System.IO.Pipelines => 160
	i64 u0xb5c38bf497a4cfe2, ; 497: lib_System.Threading.Tasks.dll.so => 211
	i64 u0xb5c7fcdafbc67ee4, ; 498: Microsoft.Extensions.Logging.Abstractions.dll => 46
	i64 u0xb5ea31d5244c6626, ; 499: System.Threading.ThreadPool.dll => 213
	i64 u0xb6def48bace2e4b8, ; 500: lib_MS.TF.Pipelines.WebApi.NetStandard.dll.so => 56
	i64 u0xb7212c4683a94afe, ; 501: System.Drawing.Primitives => 152
	i64 u0xb7b7753d1f319409, ; 502: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 503: lib_System.Private.CoreLib.dll.so => 225
	i64 u0xb8e68d20aad91196, ; 504: lib_System.Xml.XPath.dll.so => 221
	i64 u0xb9185c33a1643eed, ; 505: Microsoft.CSharp.dll => 131
	i64 u0xb9f64d3b230def68, ; 506: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 507: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba35e84542a5f7e5, ; 508: Microsoft.TeamFoundation.SourceControl.WebApi.dll => 63
	i64 u0xba4241db9ef2f88f, ; 509: Microsoft.TeamFoundation.Dashboards.WebApi => 61
	i64 u0xba4670aa94a2b3c6, ; 510: lib_System.Xml.XDocument.dll.so => 220
	i64 u0xba48785529705af9, ; 511: System.Collections.dll => 137
	i64 u0xbb65706fde942ce3, ; 512: System.Net.Sockets => 172
	i64 u0xbbd180354b67271a, ; 513: System.Runtime.Serialization.Formatters => 192
	i64 u0xbc22a245dab70cb4, ; 514: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 90
	i64 u0xbd0e2c0d55246576, ; 515: System.Net.Http.dll => 166
	i64 u0xbd3a700217b2405a, ; 516: lib_Enums.NET.dll.so => 37
	i64 u0xbd437a2cdb333d0d, ; 517: Xamarin.AndroidX.ViewPager2 => 121
	i64 u0xbd877b14d0b56392, ; 518: System.Runtime.Intrinsics.dll => 189
	i64 u0xbe65a49036345cf4, ; 519: lib_System.Buffers.dll.so => 133
	i64 u0xbea82a18727b8d18, ; 520: lib_System.Net.Http.Formatting.dll.so => 40
	i64 u0xbee38d4a88835966, ; 521: Xamarin.AndroidX.AppCompat.AppCompatResources => 98
	i64 u0xbf57209deda71318, ; 522: Microsoft.TeamFoundation.SourceControl.WebApi => 63
	i64 u0xc01d26e631e5e35f, ; 523: SQLitePCLRaw.provider.sqlite3 => 91
	i64 u0xc040a4ab55817f58, ; 524: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 525: System.Console.dll => 143
	i64 u0xc0f5a221a9383aea, ; 526: System.Runtime.Intrinsics => 189
	i64 u0xc12b8b3afa48329c, ; 527: lib_System.Linq.dll.so => 164
	i64 u0xc19da3ecfbd16a00, ; 528: lib_Microsoft.TeamFoundation.Common.dll.so => 72
	i64 u0xc1ff9ae3cdb6e1e6, ; 529: Xamarin.AndroidX.Activity.dll => 96
	i64 u0xc2260e1da1054ac1, ; 530: lib_BouncyCastle.Cryptography.dll.so => 35
	i64 u0xc26c064effb1dea9, ; 531: System.Buffers.dll => 133
	i64 u0xc28c50f32f81cc73, ; 532: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2a3bca55b573141, ; 533: System.IO.FileSystem.Watcher => 158
	i64 u0xc2bcfec99f69365e, ; 534: Xamarin.AndroidX.ViewPager2.dll => 121
	i64 u0xc4957108069a2e30, ; 535: lib_ICSharpCode.SharpZipLib.dll.so => 82
	i64 u0xc4d3858ed4d08512, ; 536: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 110
	i64 u0xc50fded0ded1418c, ; 537: lib_System.ComponentModel.TypeConverter.dll.so => 141
	i64 u0xc519125d6bc8fb11, ; 538: lib_System.Net.Requests.dll.so => 170
	i64 u0xc5293b19e4dc230e, ; 539: Xamarin.AndroidX.Navigation.Fragment => 113
	i64 u0xc5325b2fcb37446f, ; 540: lib_System.Private.Xml.dll.so => 180
	i64 u0xc5a0f4b95a699af7, ; 541: lib_System.Private.Uri.dll.so => 178
	i64 u0xc5cdcd5b6277579e, ; 542: lib_System.Security.Cryptography.Algorithms.dll.so => 196
	i64 u0xc7c01e7d7c93a110, ; 543: System.Text.Encoding.Extensions.dll => 204
	i64 u0xc7ce851898a4548e, ; 544: lib_System.Web.HttpUtility.dll.so => 217
	i64 u0xc858a28d9ee5a6c5, ; 545: lib_System.Collections.Specialized.dll.so => 136
	i64 u0xc9c62c8f354ac568, ; 546: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 148
	i64 u0xca3a723e7342c5b6, ; 547: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xca5801070d9fccfb, ; 548: System.Text.Encoding => 205
	i64 u0xcab3493c70141c2d, ; 549: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 550: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcba6056f87ed95e8, ; 551: System.Net.Http.Formatting.dll => 40
	i64 u0xcbd4fdd9cef4a294, ; 552: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc2876b32ef2794c, ; 553: lib_System.Text.RegularExpressions.dll.so => 208
	i64 u0xcc5c3bb714c4561e, ; 554: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 128
	i64 u0xcc76886e09b88260, ; 555: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 129
	i64 u0xccf25c4b634ccd3a, ; 556: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 557: System.Net.Requests => 170
	i64 u0xcdd0c48b6937b21c, ; 558: Xamarin.AndroidX.SwipeRefreshLayout => 118
	i64 u0xcef65cbf0b19b1e3, ; 559: Newtonsoft.Json.Bson => 76
	i64 u0xcf23d8093f3ceadf, ; 560: System.Diagnostics.DiagnosticSource.dll => 146
	i64 u0xcf8fc898f98b0d34, ; 561: System.Private.Xml.Linq => 179
	i64 u0xd007258538786e4a, ; 562: Microsoft.VisualStudio.Services.TestManagement.TestPlanning.WebApi => 70
	i64 u0xd03c13362192742f, ; 563: Microsoft.TeamFoundation.Core.WebApi => 60
	i64 u0xd0de8a113e976700, ; 564: System.Diagnostics.TextWriterTraceListener => 148
	i64 u0xd0fc33d5ae5d4cb8, ; 565: System.Runtime.Extensions => 186
	i64 u0xd1194e1d8a8de83c, ; 566: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 107
	i64 u0xd22a0c4630f2fe66, ; 567: lib_System.Security.Cryptography.ProtectedData.dll.so => 94
	i64 u0xd333d0af9e423810, ; 568: System.Runtime.InteropServices => 188
	i64 u0xd33a415cb4278969, ; 569: System.Security.Cryptography.Encoding.dll => 198
	i64 u0xd3426d966bb704f5, ; 570: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 98
	i64 u0xd3651b6fc3125825, ; 571: System.Private.Uri.dll => 178
	i64 u0xd373685349b1fe8b, ; 572: Microsoft.Extensions.Logging.dll => 45
	i64 u0xd3801faafafb7698, ; 573: System.Private.DataContractSerialization.dll => 177
	i64 u0xd3e4c8d6a2d5d470, ; 574: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 575: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 44
	i64 u0xd5507e11a2b2839f, ; 576: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 110
	i64 u0xd6694f8359737e4e, ; 577: Xamarin.AndroidX.SavedState => 117
	i64 u0xd6d21782156bc35b, ; 578: Xamarin.AndroidX.SwipeRefreshLayout.dll => 118
	i64 u0xd72329819cbbbc44, ; 579: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 42
	i64 u0xd72c760af136e863, ; 580: System.Xml.XmlSerializer.dll => 222
	i64 u0xd7b3764ada9d341d, ; 581: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 46
	i64 u0xd7f0088bc5ad71f2, ; 582: Xamarin.AndroidX.VersionedParcelable => 119
	i64 u0xd955a04610a32378, ; 583: NPOI.OOXML => 78
	i64 u0xd9e245a1762ddad5, ; 584: BouncyCastle.Cryptography => 35
	i64 u0xd9e828685f4d03dc, ; 585: lib_Microsoft.TeamFoundation.WorkItemTracking.WebApi.dll.so => 69
	i64 u0xda1dfa4c534a9251, ; 586: Microsoft.Extensions.DependencyInjection => 43
	i64 u0xdad05a11827959a3, ; 587: System.Collections.NonGeneric.dll => 135
	i64 u0xdb5383ab5865c007, ; 588: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdb58816721c02a59, ; 589: lib_System.Reflection.Emit.ILGeneration.dll.so => 181
	i64 u0xdb8ebbe916e760c0, ; 590: lib_Microsoft.TeamFoundation.Test.WebApi.dll.so => 64
	i64 u0xdbeda89f832aa805, ; 591: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf2a779fbc3ac31, ; 592: System.Transactions.Local.dll => 216
	i64 u0xdbf9607a441b4505, ; 593: System.Linq => 164
	i64 u0xdbfc90157a0de9b0, ; 594: lib_System.Text.Encoding.dll.so => 205
	i64 u0xdc75032002d1a212, ; 595: lib_System.Transactions.Local.dll.so => 216
	i64 u0xdc870d68ecdbd334, ; 596: GenericMaui => 130
	i64 u0xdce2c53525640bf3, ; 597: Microsoft.Extensions.Logging => 45
	i64 u0xdd2b722d78ef5f43, ; 598: System.Runtime.dll => 194
	i64 u0xdd67031857c72f96, ; 599: lib_System.Text.Encodings.Web.dll.so => 206
	i64 u0xdde30e6b77aa6f6c, ; 600: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xde110ae80fa7c2e2, ; 601: System.Xml.XDocument.dll => 220
	i64 u0xde117ffb56dbbb37, ; 602: Microsoft.TeamFoundation.Test.WebApi.dll => 64
	i64 u0xde8769ebda7d8647, ; 603: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 604: Xamarin.AndroidX.AppCompat.dll => 97
	i64 u0xe021eaa401792a05, ; 605: System.Text.Encoding.dll => 205
	i64 u0xe02f89350ec78051, ; 606: Xamarin.AndroidX.CoordinatorLayout.dll => 101
	i64 u0xe0ac7267f19ad9a5, ; 607: Microsoft.VisualStudio.Services.WebApi => 74
	i64 u0xe10b760bb1462e7a, ; 608: lib_System.Security.Cryptography.Primitives.dll.so => 199
	i64 u0xe192a588d4410686, ; 609: lib_System.IO.Pipelines.dll.so => 160
	i64 u0xe194db49531f9bc2, ; 610: lib_Microsoft.TeamFoundation.Wiki.WebApi.dll.so => 66
	i64 u0xe1a08bd3fa539e0d, ; 611: System.Runtime.Loader => 190
	i64 u0xe1ace591eebb7293, ; 612: lib_Newtonsoft.Json.Bson.dll.so => 76
	i64 u0xe1b52f9f816c70ef, ; 613: System.Private.Xml.Linq.dll => 179
	i64 u0xe1ecfdb7fff86067, ; 614: System.Net.Security.dll => 171
	i64 u0xe22fa4c9c645db62, ; 615: System.Diagnostics.TextWriterTraceListener.dll => 148
	i64 u0xe2420585aeceb728, ; 616: System.Net.Requests.dll => 170
	i64 u0xe29b73bc11392966, ; 617: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe2e426c7714fa0bc, ; 618: Microsoft.Win32.Primitives.dll => 132
	i64 u0xe3811d68d4fe8463, ; 619: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe3a586956771a0ed, ; 620: lib_SQLite-net.dll.so => 85
	i64 u0xe3b7cbae5ad66c75, ; 621: lib_System.Security.Cryptography.Encoding.dll.so => 198
	i64 u0xe4507486c308efd4, ; 622: lib_Xamarin.GooglePlayServices.Location.dll.so => 125
	i64 u0xe494f7ced4ecd10a, ; 623: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 624: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe4f74a0b5bf9703f, ; 625: System.Runtime.Serialization.Primitives => 193
	i64 u0xe5434e8a119ceb69, ; 626: lib_Mono.Android.dll.so => 228
	i64 u0xe55703b9ce5c038a, ; 627: System.Diagnostics.Tools => 149
	i64 u0xe57d22ca4aeb4900, ; 628: System.Configuration.ConfigurationManager => 92
	i64 u0xe89a2a9ef110899b, ; 629: System.Drawing.dll => 153
	i64 u0xe975d06779bc7baf, ; 630: SixLabors.Fonts.dll => 83
	i64 u0xebf54cd7f48b8f26, ; 631: MathNet.Numerics => 39
	i64 u0xeca593e6696030cc, ; 632: SQLitePCLRaw.provider.dynamic_cdecl => 89
	i64 u0xed19c616b3fcb7eb, ; 633: Xamarin.AndroidX.VersionedParcelable.dll => 119
	i64 u0xedc4817167106c23, ; 634: System.Net.Sockets.dll => 172
	i64 u0xedc632067fb20ff3, ; 635: System.Memory.dll => 165
	i64 u0xedc8e4ca71a02a8b, ; 636: Xamarin.AndroidX.Navigation.Runtime.dll => 114
	i64 u0xede195f09c234292, ; 637: Microsoft.TeamFoundation.Work.WebApi.dll => 67
	i64 u0xee81f5b3f1c4f83b, ; 638: System.Threading.ThreadPool => 213
	i64 u0xeeb7ebb80150501b, ; 639: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 100
	i64 u0xef03b1b5a04e9709, ; 640: System.Text.Encoding.CodePages.dll => 203
	i64 u0xef72742e1bcca27a, ; 641: Microsoft.Maui.Essentials.dll => 53
	i64 u0xefd1e0c4e5c9b371, ; 642: System.Resources.ResourceManager.dll => 184
	i64 u0xefec0b7fdc57ec42, ; 643: Xamarin.AndroidX.Activity => 96
	i64 u0xf00c29406ea45e19, ; 644: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 645: System.Net.NameResolution => 167
	i64 u0xf0ac2b489fed2e35, ; 646: lib_System.Diagnostics.Debug.dll.so => 145
	i64 u0xf0de2537ee19c6ca, ; 647: lib_System.Net.WebHeaderCollection.dll.so => 174
	i64 u0xf11b621fc87b983f, ; 648: Microsoft.Maui.Controls.Xaml.dll => 51
	i64 u0xf1c4b4005493d871, ; 649: System.Formats.Asn1.dll => 154
	i64 u0xf238bd79489d3a96, ; 650: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 651: lib_Xamarin.Google.Android.Material.dll.so => 122
	i64 u0xf3ddfe05336abf29, ; 652: System => 223
	i64 u0xf408654b2a135055, ; 653: System.Reflection.Emit.ILGeneration.dll => 181
	i64 u0xf4c1dd70a5496a17, ; 654: System.IO.Compression => 157
	i64 u0xf4c291d199995685, ; 655: Microsoft.TeamFoundation.WorkItemTracking.Process.WebApi.dll => 68
	i64 u0xf518f63ead11fcd1, ; 656: System.Threading.Tasks => 211
	i64 u0xf5fc7602fe27b333, ; 657: System.Net.WebHeaderCollection => 174
	i64 u0xf6077741019d7428, ; 658: Xamarin.AndroidX.CoordinatorLayout => 101
	i64 u0xf77b20923f07c667, ; 659: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e2cac4c45067b3, ; 660: lib_System.Numerics.Vectors.dll.so => 175
	i64 u0xf7e74930e0e3d214, ; 661: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf7fa0bf77fe677cc, ; 662: Newtonsoft.Json.dll => 75
	i64 u0xf84773b5c81e3cef, ; 663: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8b77539b362d3ba, ; 664: lib_System.Reflection.Primitives.dll.so => 183
	i64 u0xf8e045dc345b2ea3, ; 665: lib_Xamarin.AndroidX.RecyclerView.dll.so => 116
	i64 u0xf915dc29808193a1, ; 666: System.Web.HttpUtility.dll => 217
	i64 u0xf96c777a2a0686f4, ; 667: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 668: Microsoft.Extensions.Options => 47
	i64 u0xfa2fdb27e8a2c8e8, ; 669: System.ComponentModel.EventBasedAsync => 139
	i64 u0xfa3f278f288b0e84, ; 670: lib_System.Net.Security.dll.so => 171
	i64 u0xfa5ed7226d978949, ; 671: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 672: System.Threading.Thread => 212
	i64 u0xfb022853d73b7fa5, ; 673: lib_SQLitePCLRaw.batteries_v2.dll.so => 86
	i64 u0xfb3cb754cb2d9fc0, ; 674: lib_Plugin.LocalNotification.dll.so => 81
	i64 u0xfb64744366959b2a, ; 675: lib_Microsoft.TeamFoundation.Core.WebApi.dll.so => 60
	i64 u0xfbad3e4ce4b98145, ; 676: System.Security.Cryptography.X509Certificates => 200
	i64 u0xfbf0a31c9fc34bc4, ; 677: lib_System.Net.Http.dll.so => 166
	i64 u0xfc6b7527cc280b3f, ; 678: lib_System.Runtime.Serialization.Formatters.dll.so => 192
	i64 u0xfc719aec26adf9d9, ; 679: Xamarin.AndroidX.Navigation.Fragment.dll => 113
	i64 u0xfcd5b90cf101e36b, ; 680: System.Data.SqlClient.dll => 93
	i64 u0xfd22f00870e40ae0, ; 681: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 105
	i64 u0xfd49b3c1a76e2748, ; 682: System.Runtime.InteropServices.RuntimeInformation => 187
	i64 u0xfd536c702f64dc47, ; 683: System.Text.Encoding.Extensions => 204
	i64 u0xfd583f7657b6a1cb, ; 684: Xamarin.AndroidX.Fragment => 106
	i64 u0xfe823d402db1d205, ; 685: Microsoft.TeamFoundation.Dashboards.WebApi.dll => 61
	i64 u0xfeae9952cf03b8cb ; 686: tr/Microsoft.Maui.Controls.resources => 28
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [687 x i32] [
	i32 155, i32 118, i32 138, i32 114, i32 227, i32 97, i32 49, i32 38,
	i32 133, i32 90, i32 177, i32 24, i32 2, i32 30, i32 169, i32 126,
	i32 116, i32 137, i32 52, i32 185, i32 31, i32 218, i32 100, i32 221,
	i32 24, i32 135, i32 68, i32 183, i32 105, i32 138, i32 47, i32 135,
	i32 124, i32 201, i32 95, i32 209, i32 25, i32 129, i32 120, i32 21,
	i32 57, i32 228, i32 53, i32 66, i32 167, i32 55, i32 79, i32 82,
	i32 104, i32 156, i32 199, i32 182, i32 116, i32 56, i32 8, i32 226,
	i32 9, i32 44, i32 132, i32 159, i32 161, i32 196, i32 224, i32 12,
	i32 206, i32 129, i32 173, i32 18, i32 195, i32 134, i32 223, i32 27,
	i32 67, i32 58, i32 227, i32 211, i32 115, i32 16, i32 210, i32 47,
	i32 222, i32 59, i32 173, i32 38, i32 156, i32 147, i32 155, i32 194,
	i32 181, i32 27, i32 161, i32 214, i32 124, i32 212, i32 184, i32 143,
	i32 102, i32 58, i32 193, i32 8, i32 86, i32 127, i32 48, i32 162,
	i32 13, i32 11, i32 226, i32 145, i32 169, i32 29, i32 168, i32 150,
	i32 7, i32 208, i32 154, i32 33, i32 84, i32 20, i32 203, i32 182,
	i32 179, i32 215, i32 26, i32 73, i32 207, i32 74, i32 159, i32 5,
	i32 147, i32 219, i32 151, i32 106, i32 34, i32 70, i32 99, i32 152,
	i32 8, i32 219, i32 77, i32 6, i32 172, i32 52, i32 2, i32 50,
	i32 138, i32 121, i32 41, i32 189, i32 70, i32 149, i32 186, i32 182,
	i32 183, i32 162, i32 185, i32 104, i32 167, i32 125, i32 92, i32 120,
	i32 1, i32 75, i32 73, i32 91, i32 199, i32 40, i32 204, i32 200,
	i32 127, i32 93, i32 213, i32 218, i32 102, i32 86, i32 55, i32 112,
	i32 92, i32 98, i32 62, i32 184, i32 221, i32 78, i32 224, i32 228,
	i32 20, i32 131, i32 193, i32 127, i32 150, i32 95, i32 24, i32 84,
	i32 218, i32 22, i32 176, i32 119, i32 115, i32 186, i32 207, i32 59,
	i32 111, i32 168, i32 163, i32 180, i32 190, i32 14, i32 111, i32 227,
	i32 203, i32 209, i32 1, i32 88, i32 69, i32 50, i32 36, i32 65,
	i32 109, i32 153, i32 169, i32 144, i32 102, i32 91, i32 54, i32 25,
	i32 168, i32 187, i32 31, i32 58, i32 195, i32 194, i32 89, i32 107,
	i32 136, i32 80, i32 178, i32 87, i32 225, i32 146, i32 71, i32 214,
	i32 62, i32 15, i32 43, i32 74, i32 131, i32 79, i32 101, i32 215,
	i32 142, i32 177, i32 3, i32 123, i32 93, i32 45, i32 174, i32 72,
	i32 210, i32 188, i32 100, i32 136, i32 206, i32 140, i32 197, i32 219,
	i32 144, i32 88, i32 5, i32 185, i32 59, i32 43, i32 128, i32 165,
	i32 83, i32 162, i32 51, i32 4, i32 190, i32 225, i32 122, i32 196,
	i32 61, i32 50, i32 191, i32 143, i32 109, i32 103, i32 3, i32 152,
	i32 154, i32 9, i32 88, i32 69, i32 188, i32 18, i32 57, i32 94,
	i32 54, i32 71, i32 139, i32 48, i32 103, i32 48, i32 73, i32 113,
	i32 65, i32 52, i32 2, i32 158, i32 159, i32 28, i32 18, i32 14,
	i32 140, i32 130, i32 198, i32 11, i32 65, i32 165, i32 81, i32 41,
	i32 57, i32 83, i32 117, i32 191, i32 62, i32 17, i32 27, i32 106,
	i32 125, i32 64, i32 77, i32 7, i32 39, i32 141, i32 25, i32 4,
	i32 173, i32 124, i32 17, i32 175, i32 137, i32 35, i32 151, i32 195,
	i32 95, i32 67, i32 176, i32 126, i32 142, i32 120, i32 56, i32 89,
	i32 42, i32 108, i32 130, i32 90, i32 223, i32 33, i32 97, i32 99,
	i32 153, i32 29, i32 85, i32 63, i32 32, i32 210, i32 161, i32 60,
	i32 33, i32 41, i32 66, i32 55, i32 212, i32 156, i32 53, i32 128,
	i32 224, i32 140, i32 187, i32 111, i32 146, i32 202, i32 147, i32 9,
	i32 84, i32 202, i32 103, i32 215, i32 134, i32 75, i32 112, i32 10,
	i32 79, i32 23, i32 87, i32 126, i32 22, i32 21, i32 155, i32 87,
	i32 150, i32 34, i32 157, i32 109, i32 51, i32 104, i32 207, i32 164,
	i32 1, i32 17, i32 157, i32 6, i32 13, i32 54, i32 123, i32 142,
	i32 134, i32 38, i32 163, i32 37, i32 36, i32 114, i32 16, i32 49,
	i32 216, i32 200, i32 78, i32 76, i32 96, i32 42, i32 19, i32 145,
	i32 112, i32 108, i32 81, i32 201, i32 214, i32 122, i32 115, i32 160,
	i32 16, i32 36, i32 144, i32 192, i32 39, i32 158, i32 197, i32 175,
	i32 201, i32 222, i32 117, i32 105, i32 77, i32 132, i32 107, i32 12,
	i32 80, i32 123, i32 46, i32 71, i32 180, i32 166, i32 44, i32 5,
	i32 37, i32 163, i32 80, i32 191, i32 108, i32 149, i32 202, i32 220,
	i32 23, i32 209, i32 82, i32 19, i32 217, i32 141, i32 171, i32 139,
	i32 226, i32 176, i32 85, i32 110, i32 49, i32 26, i32 151, i32 208,
	i32 197, i32 68, i32 3, i32 72, i32 94, i32 99, i32 10, i32 0,
	i32 160, i32 211, i32 46, i32 213, i32 56, i32 152, i32 26, i32 225,
	i32 221, i32 131, i32 22, i32 15, i32 63, i32 61, i32 220, i32 137,
	i32 172, i32 192, i32 90, i32 166, i32 37, i32 121, i32 189, i32 133,
	i32 40, i32 98, i32 63, i32 91, i32 0, i32 143, i32 189, i32 164,
	i32 72, i32 96, i32 35, i32 133, i32 15, i32 158, i32 121, i32 82,
	i32 110, i32 141, i32 170, i32 113, i32 180, i32 178, i32 196, i32 204,
	i32 217, i32 136, i32 148, i32 28, i32 205, i32 20, i32 23, i32 40,
	i32 34, i32 208, i32 128, i32 129, i32 32, i32 170, i32 118, i32 76,
	i32 146, i32 179, i32 70, i32 60, i32 148, i32 186, i32 107, i32 94,
	i32 188, i32 198, i32 98, i32 178, i32 45, i32 177, i32 14, i32 44,
	i32 110, i32 117, i32 118, i32 42, i32 222, i32 46, i32 119, i32 78,
	i32 35, i32 69, i32 43, i32 135, i32 30, i32 181, i32 64, i32 30,
	i32 216, i32 164, i32 205, i32 216, i32 130, i32 45, i32 194, i32 206,
	i32 32, i32 220, i32 64, i32 11, i32 97, i32 205, i32 101, i32 74,
	i32 199, i32 160, i32 66, i32 190, i32 76, i32 179, i32 171, i32 148,
	i32 170, i32 13, i32 132, i32 21, i32 85, i32 198, i32 125, i32 12,
	i32 7, i32 193, i32 228, i32 149, i32 92, i32 153, i32 83, i32 39,
	i32 89, i32 119, i32 172, i32 165, i32 114, i32 67, i32 213, i32 100,
	i32 203, i32 53, i32 184, i32 96, i32 6, i32 167, i32 145, i32 174,
	i32 51, i32 154, i32 19, i32 122, i32 223, i32 181, i32 157, i32 68,
	i32 211, i32 174, i32 101, i32 4, i32 175, i32 31, i32 75, i32 29,
	i32 183, i32 116, i32 217, i32 10, i32 47, i32 139, i32 171, i32 0,
	i32 212, i32 86, i32 81, i32 60, i32 200, i32 166, i32 192, i32 113,
	i32 93, i32 105, i32 187, i32 204, i32 106, i32 61, i32 28
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
