ls /data/adb/Phonesky.apk >/dev/null && ui_print "- Installing real Play Store"
ls /data/adb/Phonesky.apk >/dev/null && cp /data/adb/Phonesky.apk "$MODPATH/system/priv-app/Phonesky/Phonesky.apk" || ui_print "- Real Play Store not found, installing Fake Store"
if $BOOTMODE; then
pm install --dont-kill -g "$MODPATH/system/priv-app/GmsCore/GmsCore.apk"
pm install --dont-kill "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
else
ui_print "- WARNING: Installation via recovery is NOT recommened as this breaks an workaround of an android specific. If you absolutly need to install via recovery, install GmsCore and eventually the real Play Store apk as update to manually do what the workaround would have done."
fi
