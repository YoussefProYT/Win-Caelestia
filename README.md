# Caelestia Windows feasibility build harness (NOT a portable runtime package)

This repository is a pinned-source investigation/build harness assembled on Linux after verifying both requested commits exist. It is **not** the requested `caelestia-win-portable.zip`: no Windows plugin DLL or `qs.exe` was built, no binary dependency scan was performed, and Windows runtime is not tested.

## Pins

See `PINS.txt`. Caelestia commit `fd630ffedd45eb31817e9a1726a0f567e79f65e2` and Windows port commit `f876d854f71ff582360fb5f2f4c313882d9a5f38` are verified. The port tag `v0.3.2-win2` is present in the local clone; the requested commit itself is newer than the tag. Qt target in port docs: 6.11.2 `msvc2022_64`.

## Build status and blocker

The port documents Linux cross-compilation using clang-cl/lld-link, xwin and aqt Qt in `README.md` / `WINDOWS.md`; it does **not** document a Windows-native build as a tested route (`WINDOWS.md` says native Visual Studio should work but has not been tried). The sandbox had none of clang, CMake, Ninja, xwin, PowerShell, or Windows. I did not install/download a toolchain or claim a failed compiler invocation.

More importantly, Caelestia's plugin has mandatory Qt 6.9 modules and Linux `pkg-config` dependencies (`libqalculate`, PipeWire, aubio, Cava, libsensors); source also includes Linux procfs/sysfs, Hyprland IPC and logind/D-Bus code. The repo does not yet contain verified Windows replacements/stubs for the plugin APIs. The user specifically requires real `Caelestia.Config` and `Caelestia.I18n`, as well as exact QML API parity. Producing a legitimate native plugin requires porting those internals while preserving the API of dozens of QObjects. A zip containing placeholders would not satisfy that requirement, so the harness deliberately does not masquerade as a portable package.

## Files

- `PINS.txt`: tested source refs and Qt target.
- `compat/bin/`: command shim templates for later Windows integration; they do not make Caelestia's plugin portable.
- `scripts/`: static API/QML audit tooling to run when a Windows build exists.
- `.github/workflows/build.yml`: pinned Windows Actions build attempt; it is a diagnostic build scaffold, **not a successful artifact workflow** until missing native dependencies/platform ports and API checks are resolved.
- `TESTING.md`, `PATCHES.md`, and `API-PRESERVATION.md`: test plan, patch inventory and current verification gaps.

No upstream source has been edited. `patches/` is empty because a correct lock-disable patch cannot be isolated to the allowed `shell.qml` edit: `IdleMonitors.qml` has a required `Lock` property and dereferences it for configured idle and sleep actions. Silently removing `Lock` would risk breaking QML or throwing at runtime. The Windows port's PAM/session-lock APIs are inert stand-ins; that is not a secure OS lock.

## Next implementation gate

Before packaging, implement and review separate ordered patches for: Windows-native plugin dependencies with API-preserving stubs; plugin CMake options; a safe lock-module disable that preserves `IdleMonitors` requirements; and build/package staging. Then run the Windows Actions job and require the L1/L2 checks in the task before distributing any runtime zip. See `docs/PLUGIN-AUDIT.md` for the source file/dependency inventory.
