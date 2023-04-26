if [ -n "$MMM_EXT_SUPPORT" ]; then
  ui_print "#!useExt"
  mmm_exec() {
    ui_print "$(echo "#!$@")"
  }
else
  mmm_exec() { true; }
fi

session_installer_supported=false

pm_install() {
    newretval=1
    tmplocapk=/data/local/tmp/microg_revived_TMP_DELETE_ME.apk
    cp "$2" "$tmplocapk"
    $session_installer_supported && which sed >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        sessionRaw=$(pm install-create --dont-kill "$1")
        if [ $? -eq 0 ]; then
            session=$(echo "$sessionRaw" | sed -E 's/.*\[(.*)\].*/\1/g')
            if [ $? -eq 0 ]; then
                pm install-write "$session" "$tmplocapk"
                if [ $? -eq 0 ]; then
                    pm install-commit "$session"
                    newretval=$?
                else
                    pm install-abandon "$session"
                    echo "- SBI fail, please report bug"
                fi
            fi
        fi
    fi
    if [ ! $newretval -eq 0 ]; then
        pm install --dont-kill "$1" "$2"
        newretval=$?
    fi
    rm "$tmplocapk"
    return $newretval
}

install_phonesky() {
    mmm_exec showLoading
    pm_install "" "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
    pm grant com.android.vending android.permission.FAKE_PACKAGE_SIGNATURE 2>/dev/null
    mmm_exec hideLoading
}

if $BOOTMODE; then
    mmm_exec setSupportLink "https://github.com/nift4/microg_installer_revived/issues"

    ui_print "- Installing microG GmsCore"
    mmm_exec showLoading
    pm_install "-g" "$MODPATH/system/priv-app/GmsCore/GmsCore.apk"
    pm grant com.google.android.gms android.permission.FAKE_PACKAGE_SIGNATURE 2>/dev/null
    mmm_exec hideLoading

    if [ -f /data/adb/Phonesky.apk ]; then
        ui_print "- Installing real Play Store"
        cp /data/adb/Phonesky.apk "$MODPATH/system/priv-app/Phonesky/Phonesky.apk"
        # If the real Play Store is already installed, don't install it again since
        # it will result in an error if real Play Store is not patched and has
        # already auto-updated itself
        if [ ! $(pm list packages | grep com.android.vending) ]; then
            install_phonesky
        fi
    else
        ui_print "- Real Play Store not found, installing Fake Store"
        install_phonesky
    fi

else
    abort "- ERROR: Installation via recovery is NOT supported."
fi

