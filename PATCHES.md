# Patch inventory

No upstream patches are included (`patches/` is intentionally empty). Source commits were checked out and inspected, but no changes were applied to either repository.

The task's only permitted QML edit is disabling the lock module in `shell.qml`. At the pinned source, `shell.qml` instantiates `Lock` and passes it as a required `Lock` property to `IdleMonitors` (`shell.qml` and `daemons/IdleMonitors.qml`). `IdleMonitors` dereferences that property when idle actions and sleep/lock signals occur. Removing the lock instance in a `shell.qml`-only patch would therefore leave a required property unsupplied; adding `lock: null` would retain null-dereference paths. Editing the consumer QML would violate the task rule. I did not fabricate an untested patch that might make the shell fail at startup or on sleep.

A reviewed design is needed before creating `01-disable-lock.patch`: for example, make idle lock actions safely conditional via an allowed non-QML config mechanism or obtain explicit permission to make a narrowly scoped consumer-QML patch. Until then Windows' OS lock remains untouched and no Caelestia lock is offered as secure.
