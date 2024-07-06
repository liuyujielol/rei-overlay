# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT=8.0
NUGETS="
7-zip.nativeassets.win32@22.1.0
ae.dns.client@1.0.0
ae.dns.protocol@1.0.0
aigio.any.appcenter.analytics@5.0.2
aigio.any.appcenter.crashes@5.0.2
aigio.any.appcenter@5.0.2
anglesharp.xpath@2.0.3
anglesharp@1.0.2
anglesharp@1.0.4
automapper.extensions.microsoft.dependencyinjection@12.0.1
automapper@12.0.1
avalonia.angle.windows.natives@2.1.22045.20230930
avalonia.avaloniaedit@11.0.6
avalonia.buildservices@0.0.29
avalonia.controls.colorpicker@11.1.0-rc1
avalonia.controls.datagrid@11.1.0-rc1
avalonia.controls.itemsrepeater@11.1.0-rc1
avalonia.diagnostics@11.1.0-rc1
avalonia.freedesktop@11.1.0-rc1
avalonia.native@11.1.0-rc1
avalonia.reactiveui@11.1.0-rc1
avalonia.remote.protocol@11.1.0-rc1
avalonia.skia@11.0.0
avalonia.skia@11.1.0-rc1
avalonia.themes.simple@11.1.0-rc1
avalonia.win32@11.1.0-rc1
avalonia.x11@11.1.0-rc1
avalonia.xaml.behaviors@11.1.0-rc1
avalonia.xaml.interactions.custom@11.1.0-rc1
avalonia.xaml.interactions.draganddrop@11.1.0-rc1
avalonia.xaml.interactions.draggable@11.1.0-rc1
avalonia.xaml.interactions.events@11.1.0-rc1
avalonia.xaml.interactions.responsive@11.1.0-rc1
avalonia.xaml.interactions@11.1.0-rc1
avalonia.xaml.interactivity@11.1.0-rc1
avalonia@11.1.0-rc1
avaloniaedit.textmate@11.0.6
bd.common.area@1.23.11113.11410
bd.common.birthdate@1.23.11113.11410
bd.common.essentials.preferences.sqlite@1.23.11113.11410
bd.common.essentials.primitives@1.23.10831.10300
bd.common.essentials.primitives@1.23.11113.11410
bd.common.essentials.utils@1.23.11113.11410
bd.common.essentials@1.23.10831.10300
bd.common.essentials@1.23.11113.11410
bd.common.modelvalidator@1.23.11113.11410
bd.common.mvvm.reactiveui@1.23.10831.10300
bd.common.mvvm.reactiveui@1.23.11113.11410
bd.common.mvvm@1.23.10831.10300
bd.common.mvvm@1.24.10221.11803
bd.common.phonenumber@1.23.11113.11410
bd.common.pinyin.tinypinyin@1.23.11113.11410
bd.common.pinyin@1.23.11113.11410
bd.common.primitives.apiresponse@1.23.11113.11410
bd.common.primitives@1.23.10831.10300
bd.common.primitives@1.23.11113.11410
bd.common.repositories.sqlitepcl@1.23.11113.11410
bd.common.repositories@1.23.11113.11410
bd.common.security@1.23.10831.10300
bd.common.security@1.23.11113.11410
bd.common.settings@1.23.11113.11410
bd.common.toast@1.23.10831.10300
bd.common.toast@1.23.11113.11410
bd.common.xmlnsdefinition.avalonia@0.0.0
bd.common@1.23.10831.10300
bd.common@1.24.10221.11803
castle.core@5.1.1
configureawaitchecker.analyzer@5.0.0.1
crc32.net@1.2.0
cryptsharpstandard@1.0.0
dns@7.0.0
dnsclient@1.7.0
dotnetcampus.ipc@2.0.0-alpha406
dynamicdata@7.14.2
dynamicdata@7.9.5
fleck@1.2.0
fluentavaloniaui@2.1.0-preview6
fody@6.8.0
fusillade@2.4.67
fusillade@2.6.1
gfoidl.base64@2.0.0
google.protobuf@3.24.2
harfbuzzsharp.nativeassets.linux@2.8.2.3
harfbuzzsharp.nativeassets.linux@7.3.0.2
harfbuzzsharp.nativeassets.macos@2.8.2.3
harfbuzzsharp.nativeassets.macos@7.3.0
harfbuzzsharp.nativeassets.macos@7.3.0.2
harfbuzzsharp.nativeassets.webassembly@2.8.2.3
harfbuzzsharp.nativeassets.webassembly@7.3.0.2
harfbuzzsharp.nativeassets.win32@2.8.2.3
harfbuzzsharp.nativeassets.win32@7.3.0
harfbuzzsharp.nativeassets.win32@7.3.0.2
harfbuzzsharp@2.8.2.3
harfbuzzsharp@7.3.0
harfbuzzsharp@7.3.0.2
humanizer.core.af@2.14.1
humanizer.core.ar@2.14.1
humanizer.core.az@2.14.1
humanizer.core.bg@2.14.1
humanizer.core.bn-bd@2.14.1
humanizer.core.cs@2.14.1
humanizer.core.da@2.14.1
humanizer.core.de@2.14.1
humanizer.core.el@2.14.1
humanizer.core.es@2.14.1
humanizer.core.fa@2.14.1
humanizer.core.fi-fi@2.14.1
humanizer.core.fr-be@2.14.1
humanizer.core.fr@2.14.1
humanizer.core.he@2.14.1
humanizer.core.hr@2.14.1
humanizer.core.hu@2.14.1
humanizer.core.hy@2.14.1
humanizer.core.id@2.14.1
humanizer.core.is@2.14.1
humanizer.core.it@2.14.1
humanizer.core.ja@2.14.1
humanizer.core.ko-kr@2.14.1
humanizer.core.ku@2.14.1
humanizer.core.lv@2.14.1
humanizer.core.ms-my@2.14.1
humanizer.core.mt@2.14.1
humanizer.core.nb-no@2.14.1
humanizer.core.nb@2.14.1
humanizer.core.nl@2.14.1
humanizer.core.pl@2.14.1
humanizer.core.pt@2.14.1
humanizer.core.ro@2.14.1
humanizer.core.ru@2.14.1
humanizer.core.sk@2.14.1
humanizer.core.sl@2.14.1
humanizer.core.sr-latn@2.14.1
humanizer.core.sr@2.14.1
humanizer.core.sv@2.14.1
humanizer.core.th-th@2.14.1
humanizer.core.tr@2.14.1
humanizer.core.uk@2.14.1
humanizer.core.uz-cyrl-uz@2.14.1
humanizer.core.uz-latn-uz@2.14.1
humanizer.core.vi@2.14.1
humanizer.core.zh-cn@2.14.1
humanizer.core.zh-hans@2.14.1
humanizer.core.zh-hant@2.14.1
humanizer.core@2.14.1
humanizer@2.14.1
jetbrains.annotations@2023.2.0
livechartscore.skiasharpview.avalonia@2.0.0-rc2
livechartscore.skiasharpview@2.0.0-rc2
livechartscore@2.0.0-rc2
markdig.signed@0.32.0
memorypack.core@1.9.16
memorypack.generator@1.9.16
memorypack@1.9.16
messagepack.annotations@2.5.124
messagepack@2.5.124
microcom.runtime@0.11.0
microsoft.aspnetcore.jsonpatch@7.0.0
microsoft.aspnetcore.mvc.newtonsoftjson@7.0.0
microsoft.bcl.asyncinterfaces@6.0.0
microsoft.bcl.asyncinterfaces@7.0.0
microsoft.build.tasks.git@1.1.1
microsoft.codecoverage@17.7.2
microsoft.csharp@4.7.0
microsoft.extensions.apidescription.server@6.0.5
microsoft.extensions.configuration.abstractions@6.0.0
microsoft.extensions.configuration.abstractions@7.0.0
microsoft.extensions.configuration.binder@7.0.0
microsoft.extensions.configuration@7.0.0
microsoft.extensions.dependencyinjection.abstractions@6.0.0
microsoft.extensions.dependencyinjection.abstractions@7.0.0
microsoft.extensions.dependencyinjection@6.0.0
microsoft.extensions.dependencyinjection@7.0.0
microsoft.extensions.fileproviders.abstractions@7.0.0
microsoft.extensions.fileproviders.physical@7.0.0
microsoft.extensions.filesystemglobbing@7.0.0
microsoft.extensions.logging.abstractions@6.0.0
microsoft.extensions.logging.abstractions@7.0.0
microsoft.extensions.logging.configuration@7.0.0
microsoft.extensions.logging.console@7.0.0
microsoft.extensions.logging@6.0.0
microsoft.extensions.logging@7.0.0
microsoft.extensions.options.configurationextensions@7.0.0
microsoft.extensions.options@6.0.0
microsoft.extensions.options@7.0.0
microsoft.extensions.primitives@6.0.0
microsoft.extensions.primitives@7.0.0
microsoft.net.illink.analyzers@7.0.100-1.23211.1
microsoft.net.stringtools@17.6.3
microsoft.net.test.sdk@17.7.2
microsoft.netcore.platforms@1.1.0
microsoft.netcore.platforms@1.1.1
microsoft.netcore.platforms@2.0.0
microsoft.netcore.platforms@5.0.0
microsoft.netcore.targets@1.1.0
microsoft.netcore.targets@1.1.3
microsoft.netframework.referenceassemblies.net46@1.0.3
microsoft.netframework.referenceassemblies.net472@1.0.3
microsoft.netframework.referenceassemblies@1.0.3
microsoft.openapi@1.2.3
microsoft.sourcelink.common@1.1.1
microsoft.sourcelink.github@1.1.1
microsoft.testplatform.objectmodel@17.7.2
microsoft.testplatform.testhost@17.7.2
microsoft.win32.primitives@4.3.0
microsoft.win32.registry@4.5.0
microsoft.win32.registry@5.0.0
microsoft.win32.systemevents@6.0.0
microsoft.win32.systemevents@7.0.0
moq@4.20.69
net.codecrete.qrcodegenerator@2.0.3
netstandard.library@1.6.1
netstandard.library@2.0.0
netstandard.library@2.0.3
newtonsoft.json.bson@1.0.2
newtonsoft.json@13.0.1
newtonsoft.json@13.0.2
newtonsoft.json@13.0.3
nito.asyncex.coordination@5.1.2
nito.asyncex.tasks@5.1.2
nito.collections.deque@1.1.1
nito.comparers.core@6.2.2
nito.comparers.linq@6.2.2
nito.comparers@6.2.2
nito.disposables@2.2.1
nlog.extensions.logging@5.3.3
nlog.extensions.logging@5.3.4
nlog.web.aspnetcore@5.3.3
nlog.web.aspnetcore@5.3.4
nlog@5.2.3
nlog@5.2.4
nuget.frameworks@6.5.0
nunit.analyzers@3.7.0
nunit3testadapter@4.5.0
nunit@3.13.3
operatingsystem2@3.0.0
pinvoke.advapi32@0.7.124
pinvoke.kernel32@0.7.124
pinvoke.user32@0.7.124
pinvoke.windows.core@0.7.124
pinvoke.windows.shellscalingapi@0.7.124
polly@7.2.4
portable.bouncycastle@1.9.0
protobuf-net.core@3.2.16
protobuf-net@3.2.16
punchclock@3.4.3
reactiveui.fody@19.4.1
reactiveui@18.3.1
reactiveui@19.4.1
runtime.any.system.collections@4.3.0
runtime.any.system.diagnostics.tools@4.3.0
runtime.any.system.diagnostics.tracing@4.3.0
runtime.any.system.globalization.calendars@4.3.0
runtime.any.system.globalization@4.3.0
runtime.any.system.io@4.3.0
runtime.any.system.reflection.extensions@4.3.0
runtime.any.system.reflection.primitives@4.3.0
runtime.any.system.reflection@4.3.0
runtime.any.system.resources.resourcemanager@4.3.0
runtime.any.system.runtime.handles@4.3.0
runtime.any.system.runtime.interopservices@4.3.0
runtime.any.system.runtime@4.3.0
runtime.any.system.text.encoding.extensions@4.3.0
runtime.any.system.text.encoding@4.3.0
runtime.any.system.threading.tasks@4.3.0
runtime.any.system.threading.timer@4.3.0
runtime.debian.8-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.debian.8-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.fedora.23-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.fedora.23-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.fedora.24-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.fedora.24-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.native.system.io.compression@4.3.0
runtime.native.system.net.http@4.3.0
runtime.native.system.security.cryptography.apple@4.3.0
runtime.native.system.security.cryptography.openssl@4.3.0
runtime.native.system.security.cryptography.openssl@4.3.2
runtime.native.system@4.3.0
runtime.opensuse.13.2-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.opensuse.13.2-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.opensuse.42.1-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.opensuse.42.1-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.apple@4.3.0
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.rhel.7-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.rhel.7-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.ubuntu.14.04-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.14.04-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.ubuntu.16.04-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.16.04-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.ubuntu.16.10-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.16.10-x64.runtime.native.system.security.cryptography.openssl@4.3.2
runtime.unix.microsoft.win32.primitives@4.3.0
runtime.unix.system.console@4.3.0
runtime.unix.system.console@4.3.1
runtime.unix.system.diagnostics.debug@4.3.0
runtime.unix.system.io.filesystem@4.3.0
runtime.unix.system.net.primitives@4.3.0
runtime.unix.system.net.sockets@4.3.0
runtime.unix.system.private.uri@4.3.0
runtime.unix.system.runtime.extensions@4.3.0
sharpziplib@1.4.2
skiasharp.harfbuzz@2.88.6
skiasharp.harfbuzz@2.88.8
skiasharp.nativeassets.linux@2.88.3
skiasharp.nativeassets.linux@2.88.8
skiasharp.nativeassets.macos@2.88.3
skiasharp.nativeassets.macos@2.88.6
skiasharp.nativeassets.macos@2.88.8
skiasharp.nativeassets.webassembly@2.88.3
skiasharp.nativeassets.webassembly@2.88.8
skiasharp.nativeassets.win32@2.88.3
skiasharp.nativeassets.win32@2.88.6
skiasharp.nativeassets.win32@2.88.8
skiasharp@2.88.3
skiasharp@2.88.6
skiasharp@2.88.8
splat.drawing@14.7.1
splat@14.4.1
splat@14.6.37
splat@14.6.8
splat@14.7.1
sqlite-net-pcl@1.8.116
sqlitepclraw.bundle_green@2.1.5
sqlitepclraw.bundle_green@2.1.6
sqlitepclraw.core@2.1.5
sqlitepclraw.core@2.1.6
sqlitepclraw.lib.e_sqlite3@2.1.5
sqlitepclraw.lib.e_sqlite3@2.1.6
sqlitepclraw.provider.e_sqlite3@2.1.5
sqlitepclraw.provider.e_sqlite3@2.1.6
squid-box.sevenzipsharp.lite@1.6.1.23
steamkit2@2.5.0-beta.1
stylecop.analyzers.unstable@1.2.0.507
stylecop.analyzers@1.2.0-beta.507
swashbuckle.aspnetcore.annotations@6.5.0
swashbuckle.aspnetcore.newtonsoft@6.5.0
swashbuckle.aspnetcore.swagger@6.5.0
swashbuckle.aspnetcore.swaggergen@6.5.0
swashbuckle.aspnetcore.swaggerui@6.5.0
swashbuckle.aspnetcore@6.5.0
system.appcontext@4.3.0
system.buffers@4.3.0
system.collections.concurrent@4.3.0
system.collections.immutable@1.7.1
system.collections.immutable@7.0.0
system.collections@4.3.0
system.commandline.namingconventionbinder@2.0.0-beta4.22272.1
system.commandline@2.0.0-beta4.22272.1
system.composition.attributedmodel@7.0.0
system.composition.convention@7.0.0
system.composition.hosting@7.0.0
system.composition.runtime@7.0.0
system.composition.typedparts@7.0.0
system.composition@7.0.0
system.configuration.configurationmanager@4.5.0
system.configuration.configurationmanager@6.0.0
system.configuration.configurationmanager@7.0.0
system.console@4.3.0
system.diagnostics.debug@4.3.0
system.diagnostics.diagnosticsource@4.3.0
system.diagnostics.diagnosticsource@6.0.0
system.diagnostics.eventlog@6.0.0
system.diagnostics.eventlog@7.0.0
system.diagnostics.tools@4.3.0
system.diagnostics.tracing@4.3.0
system.drawing.common@6.0.0
system.drawing.common@7.0.0
system.globalization.calendars@4.3.0
system.globalization.extensions@4.3.0
system.globalization@4.3.0
system.io.compression.zipfile@4.3.0
system.io.compression@4.3.0
system.io.filesystem.primitives@4.3.0
system.io.filesystem@4.3.0
system.io.hashing@7.0.0
system.io.pipelines@6.0.0
system.io.pipelines@7.0.0
system.io@4.3.0
system.linq.async@6.0.1
system.linq.expressions@4.3.0
system.linq@4.3.0
system.memory@4.5.3
system.memory@4.5.4
system.net.http@4.3.0
system.net.http@4.3.4
system.net.nameresolution@4.3.0
system.net.primitives@4.3.0
system.net.sockets@4.3.0
system.numerics.vectors@4.5.0
system.objectmodel@4.3.0
system.private.uri@4.3.0
system.private.uri@4.3.2
system.reactive@5.0.0
system.reactive@6.0.0
system.reflection.emit.ilgeneration@4.3.0
system.reflection.emit.lightweight@4.3.0
system.reflection.emit@4.3.0
system.reflection.extensions@4.3.0
system.reflection.metadata@1.6.0
system.reflection.primitives@4.3.0
system.reflection.typeextensions@4.3.0
system.reflection@4.3.0
system.resources.resourcemanager@4.3.0
system.runtime.caching@6.0.0
system.runtime.caching@7.0.0
system.runtime.compilerservices.unsafe@6.0.0
system.runtime.extensions@4.3.0
system.runtime.handles@4.3.0
system.runtime.interopservices.runtimeinformation@4.3.0
system.runtime.interopservices@4.3.0
system.runtime.numerics@4.3.0
system.runtime@4.3.0
system.runtime@4.3.1
system.security.accesscontrol@4.5.0
system.security.accesscontrol@5.0.0
system.security.accesscontrol@6.0.0
system.security.claims@4.3.0
system.security.cryptography.algorithms@4.3.0
system.security.cryptography.cng@4.3.0
system.security.cryptography.csp@4.3.0
system.security.cryptography.encoding@4.3.0
system.security.cryptography.openssl@4.3.0
system.security.cryptography.primitives@4.3.0
system.security.cryptography.protecteddata@6.0.0
system.security.cryptography.protecteddata@7.0.0
system.security.cryptography.protecteddata@7.0.1
system.security.cryptography.x509certificates@4.3.0
system.security.permissions@4.5.0
system.security.permissions@6.0.0
system.security.permissions@7.0.0
system.security.principal.windows@4.3.0
system.security.principal.windows@4.5.0
system.security.principal.windows@5.0.0
system.security.principal@4.3.0
system.text.encoding.codepages@7.0.0
system.text.encoding.extensions@4.3.0
system.text.encoding@4.3.0
system.text.encodings.web@7.0.0
system.text.json@7.0.0
system.text.regularexpressions@4.3.0
system.text.regularexpressions@4.3.1
system.threading.tasks.extensions@4.3.0
system.threading.tasks.extensions@4.5.4
system.threading.tasks@4.3.0
system.threading.threadpool@4.3.0
system.threading.timer@4.3.0
system.threading@4.3.0
system.valuetuple@4.5.0
system.windows.extensions@6.0.0
system.windows.extensions@7.0.0
system.xml.readerwriter@4.3.0
system.xml.xdocument@4.3.0
textmatesharp.grammars@1.0.56
textmatesharp@1.0.56
tinypinyin.net@1.0.2
tmds.dbus.protocol@0.16.0
validation@2.4.15
yarp.reverseproxy@2.1.0
zstdnet@1.4.5
zxcvbn-core@7.0.92
"

inherit dotnet-pkg desktop fcaps multibuild multiprocessing xdg

DESCRIPTION="Open source cross-platform multi-purpose game toolkit"
HOMEPAGE="
	https://steampp.net/
	https://github.com/BeyondDimension/SteamTools/
"
MY_PV=${PV/_rc/-rc.}

BASE_URI="https://github.com/BeyondDimension"
SRC_URI="
	${BASE_URI}/SteamTools/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz
"
SRC_URI+=" ${NUGET_URIS} "

S="${WORKDIR}/SteamTools-${MY_PV}"

# Manually converted from 'git submodule status --recursive'
SUBMODULES=(
"${BASE_URI}/ArchiSteamFarm a768ec43a54ef886180925a1c4ca189026ffd348 ref/ArchiSteamFarm"
"https://github.com/JustArchiNET/ASF-ui 0b812a7ab0d2f01a675d27f80008ad7b6972b4aa ref/ArchiSteamFarm/ASF-ui"
#"https://github.com/JustArchiNET/ArchiSteamFarm/wiki c56fc0c3447a50d125491edcd395c976c707c89c ref/ArchiSteamFarm/wiki"
"${BASE_URI}/Avalonia.Image2 de291c0d95887f37aa923d47e3946a7febb05ca6 ref/Avalonia.Image2"
"${BASE_URI}/DirectoryPackages 0972067aba2543ff95dfdcbe6f3fcf4ee782692f ref/Avalonia.Image2/ref/DirectoryPackages"
"${BASE_URI}/Common 4fd40563b7f96acb871f32e26be4f371383006e4 ref/Common"
"${BASE_URI}/DirectoryPackages 039620fffd0896db40c97033c871a92de35cdf83 ref/Common/ref/DirectoryPackages"
"${BASE_URI}/DirectoryPackages b6b85044cc90607258fffe92e7104fa87a8657ea ref/DirectoryPackages"
"${BASE_URI}/Facepunch.Steamworks 4463739be54bd6db5cdf85d8cddf3278a4544dfb ref/Facepunch.Steamworks"
"${BASE_URI}/Gameloop.Vdf 8e3d3dca400e9285f698d173fdc0f00bd7f3413b ref/Gameloop.Vdf"
"${BASE_URI}/Steam4NET 04f4acd8156b078f0772dfa2420a56c9e438512a ref/Steam4NET"
"${BASE_URI}/SteamAchievementManager 39dbdc9678837e7626952523ed41fa05c0e2c37b ref/SteamAchievementManager"
"${BASE_URI}/SteamClient 3cf39ef2c8cda03e445a5a1645926e8f216bd776 ref/SteamClient"
"${BASE_URI}/DirectoryPackages 3a012bc7cb9e94159a2c022c4a2be8b0a85c68c5 ref/SteamClient/ref/DirectoryPackages"
"${BASE_URI}/Gameloop.Vdf 8e3d3dca400e9285f698d173fdc0f00bd7f3413b ref/SteamClient/ref/Gameloop.Vdf"
"${BASE_URI}/Steam4NET 04f4acd8156b078f0772dfa2420a56c9e438512a ref/SteamClient/ref/Steam4NET"
"${BASE_URI}/SteamAchievementManager 4c578c1cc4c5cb0efbbb6691fda19f1ff4f361c5 ref/SteamClient/ref/SteamAchievementManager"
"${BASE_URI}/ValveKeyValue 60a5b82a82c02dfcfcae51c1393f175be5ea65bd ref/SteamClient/ref/ValveKeyValue"
"${BASE_URI}/Titanium-Web-Proxy 3f9ffce64dd6737f9496358adfbca0a7486de6c1 ref/Titanium-Web-Proxy"
"${BASE_URI}/WTTS.MicroServices.ClientSDK 09d6778004e5a223a95edb3eecc5e0119f6e85d1 ref/WTTS.MicroServices.ClientSDK"
"${BASE_URI}/DirectoryPackages 23db6c7754875b670d7dc43641714a4b189297b3 ref/WTTS.MicroServices.ClientSDK/ref/DirectoryPackages"
"${BASE_URI}/WTTS.Public 7dd2b9ccb5d4fedb37072d214f918c19de902518 ref/WTTS.MicroServices.ClientSDK/ref/WTTS.Public"
"${BASE_URI}/DirectoryPackages eb90bcddefc2b969a365ad2561f08b055ba31a5d ref/WTTS.MicroServices.ClientSDK/ref/WTTS.Public/ref/DirectoryPackages"
"${BASE_URI}/WinAuth a73491b482f31dbcaf006ec8ddac58f04b6aebf4 ref/WinAuth"
"${BASE_URI}/DirectoryPackages 16484ce157d397b93bbeeba93085fa7defb76aad ref/WinAuth/ref/DirectoryPackages"
"https://github.com/quamotion/dotnet-packaging 3f7bd3c61a00ce2c51f4f53f34d149b0ce5f8fdd ref/dotnet-packaging"
)

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
# Tests fail due to network sandbox
RESTRICT="strip test"

DEPEND="
	app-alternatives/bzip2
	app-arch/brotli
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libpcre2
	dev-libs/nss
	media-gfx/graphite2
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/harfbuzz
	media-libs/libpng
	sys-libs/libcap
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

FILECAPS=(
	'cap_net_bind_service=+eip' "/usr/share/${P}/modules/Accelerator/Steam++.Accelerator"
)

submodule_uris() {
	for line in "${SUBMODULES[@]}"; do
		read -r url commit path <<< "${line}" || die
		SRC_URI+=" ${url}/archive/${commit}.tar.gz -> ${url##*/}-${commit}.gh.tar.gz"
	done
}

submodule_uris

src_prepare() {
	for line in "${SUBMODULES[@]}"; do
		read -r url commit path <<< "${line}" || die

		mkdir -p "${S}/${path}" || die
		cp -r "${WORKDIR}"/${url##*/}-${commit}/* "${S}/${path}" || die
	done

	declare -Arg _plugins=(
		[BD.WTTS.Client.Plugins.Accelerator]=Accelerator
		[BD.WTTS.Client.Plugins.Accelerator.ReverseProxy]=Accelerator.ReverseProxy
		[BD.WTTS.Client.Plugins.Authenticator]=Authenticator
		[BD.WTTS.Client.Plugins.GameAccount]=GameAccount
		[BD.WTTS.Client.Plugins.GameList]=GameList
		[BD.WTTS.Client.Plugins.GameTools]=GameTools
		[BD.WTTS.Client.Plugins.SteamIdleCard]=SteamIdleCard
		[BD.WTTS.Client.Plugins.ArchiSteamFarmPlus]=ArchiSteamFarmPlus
		#[BD.WTTS.Client.Plugins.Update]=Update
	)

	MULTIBUILD_VARIANTS=( TOOLKIT ${!_plugins[@]} )

	dotnet-pkg_src_prepare
}

my_dotnet_variant_buildconfig() {
	DOTNET_PKG_PROJECTS=()
	DOTNET_PKG_OUTPUT=''
	DOTNET_PKG_BUILD_EXTRA_ARGS=(
		--framework "net${DOTNET_PKG_COMPAT}"
	)

	case "${MULTIBUILD_VARIANT}" in
		"TOOLKIT")
			DOTNET_PKG_PROJECTS=( "${S}/src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj" )
			DOTNET_PKG_OUTPUT="$(dotnet-pkg-base_get-output "${P}")"
			;;
		"BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
			DOTNET_PKG_PROJECTS=( "${S}/src/${MULTIBUILD_VARIANT}/${MULTIBUILD_VARIANT}.csproj" )
			DOTNET_PKG_BUILD_EXTRA_ARGS+=(
				--nologo
				-p:PublishSingleFile=true
				--self-contained
				-v q
				-p:WarningLevel=1
			)
			DOTNET_PKG_OUTPUT="$(dotnet-pkg-base_get-output "${_plugins[${MULTIBUILD_VARIANT}]}")"
			;;
		*)
			DOTNET_PKG_PROJECTS=( "${S}/src/${MULTIBUILD_VARIANT}/${MULTIBUILD_VARIANT}.csproj" )
			DOTNET_PKG_BUILD_EXTRA_ARGS+=(
				--nologo
				-v q
				-p:WarningLevel=1
			)
			DOTNET_PKG_OUTPUT="$(dotnet-pkg-base_get-output "${_plugins[${MULTIBUILD_VARIANT}]}")"
			;;
	esac
}

src_configure() {
	my_src_configure() {
		my_dotnet_variant_buildconfig
		dotnet-pkg_src_configure
	}
	multibuild_foreach_variant my_src_configure
}

src_compile() {
	my_src_compile() {
		my_dotnet_variant_buildconfig
		if [[ ${MULTIBUILD_VARIANT} == "BD.WTTS.Client.Plugins.Accelerator.ReverseProxy" ]]; then
			local -a build_args=(
				--configuration "${DOTNET_PKG_CONFIGURATION}"
				--no-restore
				--output "${DOTNET_PKG_OUTPUT}"
				--runtime "${DOTNET_PKG_RUNTIME}"
				-maxCpuCount:$(makeopts_jobs)
			)

			if ! use debug ; then
				build_args+=(
					-p:StripSymbols=false
					-p:NativeDebugSymbols=false
				)
			fi
			dotnet-pkg_foreach-project \
				edotnet build "${build_args[@]}" "${DOTNET_PKG_BUILD_EXTRA_ARGS[@]}"
		else
			dotnet-pkg_src_compile
		fi
	}
	multibuild_foreach_variant my_src_compile
}

src_install() {
	my_src_install() {
		my_dotnet_variant_buildconfig
		case "${MULTIBUILD_VARIANT}" in
			"TOOLKIT")
				dotnet-pkg-base_install "/usr/share/${P}"
				;;
			"BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
				insinto "/usr/share/${P}/modules/Accelerator/"
				doins -r "${DOTNET_PKG_OUTPUT}"/Steam++.Accelerator*
				#dotnet-pkg-base_install "/usr/share/${P}/modules/Accelerator"
				fperms +x "/usr/share/${P}/modules/Accelerator/Steam++.Accelerator"
				;;
			*)
				insinto "/usr/share/${P}/modules/${_plugins[${MULTIBUILD_VARIANT}]}/"
				doins "${DOTNET_PKG_OUTPUT}/${MULTIBUILD_VARIANT}.dll"
				;;
		esac
	}

	multibuild_foreach_variant my_src_install

	dotnet-pkg-base_dolauncher "/usr/share/${P}/Steam++" watt-toolkit

	insinto "/usr/share/${P}/script"
	doins "${S}/build/linux/environment_check.sh"
	fperms +x "/usr/share/${P}/script/environment_check.sh"

	domenu "${FILESDIR}/watt-toolkit.desktop"
	for size in 16 24 32 48 64 96 128 256 512; do
		newicon -s ${size} "${S}/res/icons/app/v3/Logo_${size}.png" watt-toolkit.png
	done
	newicon -s scalable "${S}/res/icons/app/v3/Icon_Logo.svg" watt-toolkit.svg
}

pkg_postinst() {
	fcaps_pkg_postinst
	xdg_pkg_postinst
}
