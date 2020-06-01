NOTE: Now on Magisk repo: https://github.com/Magisk-Modules-Repo/microG_installer (the [nift4](https://github.com/nift4/microg_installer_revived) repo has the development version (and it's used for pull requests and issues) while the magisk repo has the stable version)

NOTE2: This repo was an fork of the original repo (code is [here](https://github.com/nift4/microg_installer/tree/23de13101d8dd5807f713d0cace4a565478c6cfd?files=1)) that is deleted, so GitHub has chosen another fork as original repo. 

# microG Installer Revived

This is a Magisk module that installs microG GmsCore, GsfProxy and DroidGuard Helper to `/system/priv-app`.

## Why you may want to use it

UnifiedNlp, which is bundled with GmsCore, if installed as an user app doesn't work on Android 7 and newer without [an additional patch](https://github.com/microg/android_packages_apps_UnifiedNlp/blob/master/patches/android_frameworks_base-N.patch). An another solution to the above problem is to install the app as a privileged system app. However, this way is not perfect, due to those kind of apps being wiped after an OTA update. Therefore, I'm creating this module to help simplify the installation of microG with working network-based location.

DroidGuard Helper needs to be installed as a system app in order to pass SafetyNet.

GsfProxy needs to be an system app for some third-party apps.

Currently, GmsCore 0.2.10, GsfProxy 0.1.0, FakeStore 0.0.2 and DroidGuard Helper 0.1-preview are bundled in the module.

**Note**: Install this module before installing any GMS-dependent apps, as well as do not disable it after installing such apps, unless you know what you're doing.

## Installation
- Install the module
- If you have EdXposed: Look [here](https://github.com/nift4/microg_installer_revived/issues/4)
- Choose an solution for [Signature spoofing](https://github.com/microg/android_packages_apps_GmsCore/wiki/Signature-Spoofing)

## How do I get the real Play Store?

First, if it is broken, it's microG's fault, not mine :P

**Simple way**
Install the Play Store APK of your choice before installing the module.

**Solid way**
Okay, get an Play Store APK (I suggest the patched Play Store by Nanolx). Then put it into

```
/data/adb/modules/microg_installer/system/priv-app/Phonesky/
```

named `Phonesky.apk`. You need to do that after every module update... Sorry. Maybe I will handle this better at a later point.

## Doesn't NanoDroid fix the problem?

Yes.

However, NanoDroid is **heavily cluttered** (while they claim to de-bloat your device). A NanoDroid-microG installation with default settings will flood your system with lots of their own included apps, e.g. Nanolx's GmsCore, Play Store, some UnifiedNlp backends. Although this behavior can be altered by creating a kind-of installation settings file, it's just a waste of time for people who want to have a _clean_ and _working_ microG setup with nothing redundant included. It's only suitable for those who want an out-of-the-box experience, or don't want to bother setting up microG manually.

In brief, things seem to be complicated with NanoDroid. Why can't it just install microG and let users decide what to install afterwards?

## Build

### Linux, BSD, macOS, Android
Requires wget.

    wget -O META-INF/com/google/android/update-binary https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh

And ZIP it.
### Other
Download [this](https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh) and put it into `META-INF/com/google/android/update-binary`. And ZIP it.
## Credits

- **microG project** for their awesome work.
- **Hieu Van** for the original microG Installer
