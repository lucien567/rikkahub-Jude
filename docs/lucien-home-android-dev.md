# Lucien Home Android · first test build

This is a **separate development APK** built from Jude, not yet a replacement for Sienna × Lucien Home.

## Scope

- The existing Jude `public` and `personal` flavors are unchanged.
- A new `home` flavor has its own application ID and launcher name.
- `homeDebug` installs as `io.github.lucien567.lucienhome.debug`, independently of Jude.
- All existing chat, providers, assistants, memory and tools remain intact. No private Home history, secrets or personalization is committed.
- The original Jude icon and in-app branding have **not** been replaced yet.

## Build on Windows

1. Open the repo in Android Studio with a compatible Android SDK/JDK and let Gradle sync.
2. Supply your own development `app/google-services.json` according to upstream's build requirements. **Never commit Firebase credentials or private keys.**
3. Select the `homeDebug` variant and Run on an emulator or a phone connected via USB / wireless debugging; or run:

   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts\build-home-debug-apk.ps1
   ```

4. The universal APK is expected at `app/build/outputs/apk/home/debug/app-home-universal-debug.apk`.

## Updating and testing

- Android Studio Run or `adb install -r <APK path>` updates a matching installed development build without manually downloading it again.
- Updating in place requires **the same application ID and the same signing certificate**. The local Android debug keystore generally stays stable on the same development machine. CI/debug keys created on other machines may differ.
- Back up important data before database/schema changes; this initial build intentionally does not migrate Jude or old Home data.
- Only submit changes as a draft PR. Do not merge into `main` or remove old Home until Sienna has tested and approved it.

## Verification status

Not yet compiled or device-tested in this PR. The first check is `:app:assembleHomeDebug` in Android Studio, followed by an actual phone smoke test.
