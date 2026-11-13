# API preservation and unresolved QML types — current status

## Verification status

**Not verified at L2.** No Windows plugin build or Windows output tree exists, so an original-vs-built API comparison and DLL import inspection could not be performed. This harness does not claim that any Caelestia plugin API is preserved in a Windows binary.

`API-ORIGINAL.tsv` is a generated baseline from the pinned original plugin headers, using `scripts/api_manifest.py`. It contains textual declarations extracted for `Q_PROPERTY`, `Q_INVOKABLE`, `Q_SIGNAL` and signals. It is a baseline only; C++ macro-generated declarations, aliases and normalized types may require manual review. After a Windows build, rerun:

```powershell
python scripts/api_manifest.py .\caelestia\plugin\src\Caelestia --built .\build\plugin-headers --out API-COMPARISON.tsv
```

The `--built` tree must contain the exact corresponding public headers used for the built DLL. The script fails when it finds a missing textual declaration. That comparison supplements, but does not replace, compilation, QML type registration inspection, qmldir/.qmltypes checks, and runtime QML import testing.

## QML module availability

No Caelestia QML module has been confirmed in a Windows plugin because none was built. The essential `Caelestia.Config` and `Caelestia.I18n` modules must be built from real project sources per the task; they are not stubbed by this harness. Likewise, every other `Caelestia.*` module imported by the shell remains **unverified/unresolved** pending plugin DLL generation and import testing. The port's Quickshell shims do not provide the Caelestia modules.

For Quickshell types, the port's README/WINDOWS.md document Windows implementations for panels/layer shell, Hyprland compatibility, shortcuts, MPRIS, PipeWire/Core Audio, notifications, tray, UPower, Bluetooth, screencopy and Windows extras. That is documentation evidence, not a Caelestia build or runtime check. The port explicitly describes Pam/Polkit/session-lock as inert. Exact version parity with Caelestia's `quickshell-git` requirement remains unverified.
