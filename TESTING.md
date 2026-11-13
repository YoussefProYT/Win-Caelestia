# Windows 10 22H2 tester checklist — NOT YET RUN

This is a test plan only. The current fallback archive contains no `qs.exe`, Caelestia plugin DLL, or ready-to-run portable package. Do not interpret these steps as proof of operation.

1. On a non-production Windows 10 22H2 x64 account, extract the eventual signed-off package into a user-writable folder. Do not run as administrator. Confirm no registry, policy, or lock-screen changes are requested.
2. Before Caelestia, run the port's example bar from a console: `qs -p "$env:LOCALAPPDATA\Programs\Quickshell\examples\bar\shell.qml"`. Record exact output, screenshot, display/virtual-desktop behavior, clock, active window, and media state. This must pass before testing Caelestia.
3. Run `./run-caelestia.ps1` from PowerShell. Capture full terminal output and `%LOCALAPPDATA%\caelestia-win\logs\`.
4. Check rendering, missing QML modules/types, console warnings/errors, command shim calls, config/data/cache/state paths, and whether the shell remains responsive. Do not test power actions. Keep `CAELESTIA_WIN_ALLOW_POWER` unset.
5. Verify Windows' own Win+L still locks the workstation. Do not claim Caelestia's lock UI is secure or test it as a replacement.
6. Use `collect-logs.ps1` to create a diagnostic archive. Remove the extracted folder to uninstall; the harness does not use a system installer.

First checks to prioritize: (a) example bar starts; (b) `Caelestia.Config` and `Caelestia.I18n` resolve and configuration loads; (c) inventory all failed `Caelestia.*`/Quickshell APIs and prevent accidental power actions.
