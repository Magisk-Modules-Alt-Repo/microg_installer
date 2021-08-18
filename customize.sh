ls /data/adb/Phonesky.apk >/dev/null && ui_print "- Installing real Play Store"
ls /data/adb/Phonesky.apk >/dev/null && cp /data/adb/Phonesky.apk "$MODPATH/system/priv-app/Phonesky/Phonesky.apk" || ui_print "- Real Play Store not found, installing Fake Store"
pm install --dont-kill -g "$MODPATH/system/priv-app/GmsCore/GmsCore.apk"
pm install --dont-kill "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
