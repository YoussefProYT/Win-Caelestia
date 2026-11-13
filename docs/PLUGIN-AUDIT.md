# Native plugin source inventory and initial dependency map

Source set: pinned Caelestia commit `fd630ffedd45eb31817e9a1726a0f567e79f65e2`. “UNCLASSIFIED” is intentional: no Windows compiler validation occurred, and this does not label files as safe to build.

| Source file | Classification | Direct/known dependency focus |
|---|---|---|
| `src/Caelestia/Blobs/blobgroup.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Blobs/blobinvertedrect.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Blobs/blobmaterial.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Blobs/blobrect.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Blobs/blobshape.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/animatedrepeater.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/buttonrow.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/circularindicatormanager.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/lazylistview.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/linearindicatormanager.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/roundedmask.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/sparklineitem.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/visualiserbars.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Components/wavyline.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/anim.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/appearanceconfig.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/borderconfig.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/common.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/configattached.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/font.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/fontbuilder.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/rootnodes.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Config/tokensattached.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/I18n/pluralrules.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/I18n/translator.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Images/imageanalyser.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Models/appdb.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Models/filesystemmodel.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Multimedia/imagecache.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Multimedia/imagecacheworker.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Multimedia/ktxencoder.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Multimedia/visualsource.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/audiocollector.cpp` | **UNCLASSIFIED** | PipeWire |
| `src/Caelestia/Services/audioprovider.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/beattracker.cpp` | **UNCLASSIFIED** | aubio |
| `src/Caelestia/Services/cavaprovider.cpp` | **UNCLASSIFIED** | Cava |
| `src/Caelestia/Services/cpu.cpp` | **UNCLASSIFIED** | /proc,/sys |
| `src/Caelestia/Services/diskinfo.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/gpu.cpp` | **UNCLASSIFIED** | /sys and GPU probe commands |
| `src/Caelestia/Services/hyprdevices.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/hyprextras.cpp` | **UNCLASSIFIED** | Hyprland Unix sockets |
| `src/Caelestia/Services/lyriccandidate.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/lyrics.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/memory.cpp` | **UNCLASSIFIED** | /proc |
| `src/Caelestia/Services/networkusage.cpp` | **UNCLASSIFIED** | /proc |
| `src/Caelestia/Services/sensorslib.cpp` | **UNCLASSIFIED** | libsensors |
| `src/Caelestia/Services/service.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/serviceref.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Services/sessionmanager.cpp` | **UNCLASSIFIED** | logind/systemd D-Bus |
| `src/Caelestia/Services/storage.cpp` | **UNCLASSIFIED** | /sys |
| `src/Caelestia/Services/tickingservice.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/changebatcher.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/codecs.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/common.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/listnode.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/node.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/objectnode.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/quarantine.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/rootnode.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/schema.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/Settings/settingsfile.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/State/common.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/State/rootnodes.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/circularbuffer.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/cutils.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/qalculator.cpp` | **UNCLASSIFIED** | libqalculate |
| `src/Caelestia/requests.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |
| `src/Caelestia/toaster.cpp` | **UNCLASSIFIED** | Qt / Caelestia internal APIs; platform review still required |

Known mandatory external packages from `plugin/CMakeLists.txt`: Qt 6 components ShaderTools, Core, Qml, Gui, Quick, QuickControls2, Concurrent, Sql, Network, DBus, Multimedia; pkg-config modules libqalculate, libpipewire-0.3, aubio, libcava (fallback cava); libsensors headers/library. Most other files use Qt and internal Caelestia APIs, but need Windows portability review. Build classes are not assigned BUILD AS-IS without a Windows compiler.
