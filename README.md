# microG Installer

This is a Magisk module that installs microG GmsCore and DroidGuard Helper to `/system/priv-app`.

## Why you may want to use it

UnifiedNlp, which is bundled with GmsCore, if installed as an user app doesn't work on Android 7 and newer without [an additional patch](https://github.com/microg/android_packages_apps_UnifiedNlp/blob/master/patches/android_frameworks_base-N.patch). An another solution to the above problem is to install the app as a privileged system app. However, this way is not perfect, due to those kind of apps being wiped after an OTA update. Therefore, I'm creating this module to help simplify the installation of microG with working network-based location.

DroidGuard Helper needs to be installed as a system app in order to pass SafetyNet.

Currently, GmsCore 0.2.8.17785-mapbox and DroidGuard Helper 0.1.0 are bundled in the module.

**Note**: Install this module before installing any GMS-dependent apps, as well as do not disable it after installing such apps, unless you know what you're doing.

## Doesn't NanoDroid fix the problem?

Yes.

However, NanoDroid is **heavily cluttered** (while they claim to de-bloat your device). A NanoDroid-microG installation with default settings will flood your system with lots of their own included apps, e.g. Nanolx's GmsCore, Play Store, some UnifiedNlp backends. Although this behavior can be altered by creating a kind-of installation settings file, it's just a waste of time for people who want to have a _clean_ and _working_ microG setup with nothing redundant included. It's only suitable for those who want an out-of-the-box experience, or don't want to bother setting up microG manually.

In brief, things seem to be complicated with NanoDroid. Why can't it just install microG and let users decide what to install afterwards?

## Credits

- **microG project** for their awesome work.
