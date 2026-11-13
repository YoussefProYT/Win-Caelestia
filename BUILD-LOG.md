# Build and verification log

Timestamp: 2026-11-13 (sandbox timezone +02:00).

## Environment observed

- Linux x86_64, Ubuntu 24.04.5 LTS, kernel `6.18.38+`.
- `git`, `zip`, and `sha256sum` present.
- `clang`, `clang-cl`, `lld-link`, `llvm-objdump`, `cmake`, `ninja`, `xwin`, and `pwsh` not found on `PATH`.
- Internet access probe to GitHub returned HTTP/2 200.

## Pin verification

Commands run:

```sh
git clone --no-checkout https://github.com/caelestia-dots/shell /home/ubuntu/caelestia-win-work/src/caelestia
git -C /home/ubuntu/caelestia-win-work/src/caelestia fetch --depth 1 origin fd630ffedd45eb31817e9a1726a0f567e79f65e2
git -C /home/ubuntu/caelestia-win-work/src/caelestia checkout --detach FETCH_HEAD
git clone --no-checkout https://github.com/nunreasonable/quickshell-windows /home/ubuntu/caelestia-win-work/src/port
git -C /home/ubuntu/caelestia-win-work/src/port fetch --depth 1 origin f876d854f71ff582360fb5f2f4c313882d9a5f38
git -C /home/ubuntu/caelestia-win-work/src/port checkout --detach FETCH_HEAD
git ls-remote https://github.com/miurahr/aqtinstall.git HEAD
```

Observed HEADs matched the requested Caelestia and port hashes exactly. `git ls-remote` returned aqtinstall HEAD `5a49f2b391ae8ee1d3c0dd87f8b33c1d49a4deb7`; the port README warns aqtinstall 3.3.0 cannot read Qt 6.11's repository, so the workflow points at this source commit rather than 3.3.0.

## Build attempts

No compiler, CMake configure/build, Windows installer, or Windows execution was run. The environment lacks the required toolchain; `BUILD.md`/`WINDOWS.md` were inspected. No error text from an actual build exists; do not represent missing executables as a compiler error. The GitHub Actions workflow has not been pushed or run.

## Verification levels

- **L1 (compile/link): NOT REACHED.** No Windows build.
- **L2 (DLL import listing, qmldir/.qmltypes output, original-vs-built API comparison): NOT REACHED.** No build outputs. `API-ORIGINAL.tsv` is only an original-source baseline.
- **L3 (Windows runtime): NOT RUN.** This task ran on Linux.

No full build log exists because no build was attempted. The exact source inspection, tool availability and pin commands above are recorded instead.
