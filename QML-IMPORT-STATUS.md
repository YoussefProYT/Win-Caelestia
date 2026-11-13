# Imported QML module/type resolution status

This is static-source status, not a compiled import check. No Windows `qmldir`, `.qmltypes`, DLL, or `qs.exe` output exists, so actual resolution is **unverified** for all modules below. The counts are import statement counts across the pinned Caelestia QML inventory (678 statements in 260 files).

## Caelestia modules

The Windows Quickshell port does not itself supply Caelestia plugin modules. All modules below must be provided by Caelestia's plugin build. In this harness, they are currently **UNRESOLVED** because no plugin was built:

| Module | Imports |
|---|---:|
| `Caelestia` | 42 |
| `Caelestia.Blobs` | 5 |
| `Caelestia.Components` | 27 |
| `Caelestia.Config` | 233 — must be real, not stubbed |
| `Caelestia.I18n` | 118 — must be real, not stubbed |
| `Caelestia.Images` | 2 |
| `Caelestia.Models` | 7 |
| `Caelestia.Multimedia` | 8 |
| `Caelestia.Services` | 20 |
| `Caelestia.Shaders` | 1 |
| `Caelestia.State` | 9 |

## Quickshell modules

The primary port documents Windows APIs for panels/WlrLayershell, Hyprland compatibility, shortcuts, MPRIS, PipeWire/Core Audio, notifications, tray, UPower, Bluetooth and screencopy. Documentation does not prove every property and method Caelestia calls resolves against that exact port revision. `Quickshell.Services.Pam` and Wayland session-lock APIs are documented as inert stand-ins.

| Module | Imports | Static result |
|---|---:|---|
| `Quickshell` | 117 | Port core documented; specific Caelestia API parity untested |
| `Quickshell.Bluetooth` | 7 | Port-documented Windows implementation; untested |
| `Quickshell.Hyprland` | 10 | Port-documented compatibility layer; Caelestia subset parity untested |
| `Quickshell.Io` | 22 | No Caelestia integration test or exhaustive per-API compatibility claim |
| `Quickshell.Services.Mpris` | 3 | Port-documented; untested |
| `Quickshell.Services.Notifications` | 6 | Port-documented; untested |
| `Quickshell.Services.Pam` | 1 | Inert stand-in; authentication is not implemented |
| `Quickshell.Services.Pipewire` | 4 | Port docs map this API to Windows Core Audio; untested |
| `Quickshell.Services.SystemTray` | 3 | Port-documented; untested |
| `Quickshell.Services.UPower` | 7 | Port-documented; untested |
| `Quickshell.Wayland` | 13 | Mixed: panel/screencopy/toplevel APIs documented, session lock inert/unverified |
| `Quickshell.Widgets` | 13 | Not individually validated against this exact source/API combination |

The static scan found `PanelWindow`, `WlrLayershell`, `ScreencopyView`, `WlSessionLock`, `WlSessionLockSurface`, `GlobalShortcut`, `IpcHandler`, `Variants`, `FileView`, `Process`, `Hyprland.*` properties and dispatch methods. It found no `JsonAdapter`. Actual type-level resolution requires a Windows build and QML import test. `qmllint` output or package documentation alone is not a substitute for L2.
