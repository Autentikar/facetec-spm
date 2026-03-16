# AKFaceTecSDK *by Autentikar*
## version 9.7.112 :rocket:

Autentikar FaceTec Recognition SDK.

Works with `FaceTecSDK` framework.

---

## Environments: Production vs Development

This package supports two FaceTec dependency sources:

| Environment | Dependency |
|---|---|
| **Production** (default) | `faceTec-dependency` |
| **Development** | `facetec-development-dependency` |

> **Important:** Use the **Development** environment if you are testing in Debug mode. The production dependency may crash when running a debug build.

> ⚠️ **Critical for App Store / TestFlight submissions:** Always make sure you are using the **Production** environment before archiving and submitting your app. Submitting with the Development dependency will cause issues in release builds.

### Switch to Development environment

This is the **only case** where you need to open Xcode from the terminal. Opening it from Finder, Dock, or Spotlight will always use Production (the default).

1. Open a terminal and run the following commands **in order**:

```bash
# Force quit Xcode (important: 'open' won't work if Xcode is already running)
killall Xcode

# Set the environment variable and open your project
export FACETEC_ENV=dev
open YourApp.xcodeproj      # use .xcodeproj or .xcworkspace, both work
```

> ⚠️ If Xcode is already open when you run `open`, macOS will reuse the existing process and the variable **will not take effect**. Always use `killall Xcode` first.

2. Once Xcode opens, go to **File > Packages > Reset Package Caches** to force SPM to pick up the change.

### Switch back to Production

Close Xcode and reopen it normally from Finder, Dock, or Spotlight — no terminal needed. The `FACETEC_ENV` variable only exists in the terminal session where you set it, so Production is restored automatically.

---

# Updated
* Upgrade FaceTecSDK to 9.7.112.
