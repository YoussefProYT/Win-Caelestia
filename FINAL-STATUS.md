# Final status

- **Built:** fallback investigation/build harness ZIP only; not `caelestia-win-portable.zip` and not runnable.
- **Pins:** Caelestia `fd630ffedd45eb31817e9a1726a0f567e79f65e2`; Quickshell Windows `f876d854f71ff582360fb5f2f4c313882d9a5f38`; Qt target documented as 6.11.2 MSVC 2022 x64.
- **L1 compile/link:** NOT REACHED.
- **L2 imports/API/DLL audit:** NOT REACHED; original header baseline and static import status only.
- **L3 Windows runtime:** NOT RUN.
- **Stubbed commands:** shim templates log `caelestia`, `nmcli`, `brightnessctl`, `ddcutil`, `hyprctl`, `pidof`, `gpu-screen-recorder`, `swappy`, `ip`, `fish`, `qalc`, `notify-send`, `wl-copy`, and `asdbctl`; they do not provide those services. Power commands remain dry-run unless an explicit environment opt-in is set.
- **Not stubbed/preserved in a built DLL:** native Caelestia plugin and all its service APIs. `Caelestia.Config` and `Caelestia.I18n` are required to be real, but neither was built.
- **Patch status:** no upstream patches were applied; the lock-disable patch is withheld because `IdleMonitors` requires and dereferences the Lock object.
- **Risks:** Linux native dependencies/platform APIs remain; exact private-Qt ABI and Quickshell API parity are unverified; port PAM/session lock is inert and not Windows security.
- **First tester checks after a real build exists:** port example bar; resolve real Config/I18n/plugin imports and read settings; capture QML errors and verify ordinary actions without enabling power operations.

This fallback is a diagnostic scaffold only. Its workflow has not been run and uploads logs only; it does not produce or claim a working package.
