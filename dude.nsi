RequestExecutionLevel user
Name "Dude"
OutFile "dude_install.exe"
InstallDir "$LOCALAPPDATA\Dude"

Function .onInit
    System::Call 'kernel32::CreateMutex(p 0, i 0, t "myMutex") p .r1 ?e'
    Pop $R0
    StrCmp $R0 0 +3
    MessageBox MB_OK|MB_ICONEXCLAMATION "The installer is already running."
    Abort

    CreateDirectory "$SMPROGRAMS\Dude"
    CreateShortCut "$SMPROGRAMS\Dude\Dude.lnk" "$INSTDIR\dude.exe"
    CreateShortCut "$SMPROGRAMS\Dude\Uninstall Dude.lnk" "$INSTDIR\dude_uninstall.exe"

    InitPluginsDir
    File /oname=$PLUGINSDIR\dude_splash.jpg dude_logo.jpg
    File /oname=$PLUGINSDIR\dude_splash.wav dude_splash.wav
    newadvsplash::play /NOUNLOAD "$PLUGINSDIR\dude_splash.wav"
    newadvsplash::show /NOUNLOAD 9999999 0 0 -1 /BANNER "$PLUGINSDIR\dude_splash.jpg"

    SetOutpath "$INSTDIR"
    File "dude.7z"
    Nsis7z::ExtractWithDetails "$INSTDIR\dude.7z" "Decompressing %s..."

    WriteUninstaller "$INSTDIR\dude_uninstall.exe"
    Exec "$INSTDIR\dude.exe"
    Quit
FunctionEnd

Section
    SetOutpath "$INSTDIR"
    File "dude.7z"
SectionEnd

Section "un.Uninstall"
    Delete "$SMPROGRAMS\Dude\Dude.lnk"
    Delete "$SMPROGRAMS\Dude\Uninstall Dude.lnk"
    RMDir /r "$INSTDIR"
SectionEnd
