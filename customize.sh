if [ -n "$MMM_EXT_SUPPORT" ]; then
  ui_print "#!useExt"
  mmm_exec() {
    ui_print "$(echo "#!$@")"
  }
else
  mmm_exec() { true; }
fi
if ! $BOOTMODE; then
    abort "- ERROR: Installation via recovery is NOT supported."
fi
mmm_exec setSupportLink "https://github.com/nift4/microg_installer_revived/issues"

if [ -f /data/adb/Phonesky.apk ]; then
    ui_print "- Installing real Play Store"
    cp /data/adb/Phonesky.apk "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
else
    ui_print "- Real Play Store not found, installing Companion"
fi
# If the real Play Store is already installed, don't install it again since
# it will result in an error if real Play Store is not patched and has
# already auto-updated itself
if [ ! $(pm list packages | grep com.android.vending) ]; then
    mmm_exec showLoading
    pm install "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
    mmm_exec hideLoading
fi
pm grant com.android.vending android.permission.FAKE_PACKAGE_SIGNATURE 2>/dev/null

ui_print "- Installing microG GmsCore"
# If we install GmsCore update, Magisk Manager will be killed
# that's because Magisk Manager creates classloader of GmsCore in SSL provider
# so if GmsCore gets killed, Magisk Manager gets killed by framework as well
# if we just dont kill GmsCore, it's fine. we use --dont-kill for that
# however thats only intended for split APKs and google enforced that
# it stopped working after https://github.com/aosp-mirror/platform_frameworks_base/commit/93c2c2a292ea8695038afdd044bcb51e2e366780
# keep it here for legacy while i think of a better solution
# (workaround this by installing gmscore as last step)
mmm_exec showLoading
pm install --dont-kill -g "$MODPATH/system/priv-app/GmsCore/GmsCore.apk"
mmm_exec hideLoading
