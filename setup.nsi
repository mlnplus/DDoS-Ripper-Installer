!define APPNAME "DDoS-Ripper Installer"
!define VERSION "1.0"
!define INSTALLFOLDER "$PROGRAMFILES64\DDoS-Ripper"

Name "${APPNAME} v${VERSION}"
OutFile "DDoS-Ripper-Setup.exe"
InstallDir "${INSTALLFOLDER}"
InstallDirRegKey HKLM "Software\${APPNAME}" "Install_Dir"
RequestExecutionLevel admin  ; Typically required to write to Program Files folder

Page components
Page instfiles

Section "DDoS-Ripper" SEC01
    SetOutPath "$INSTDIR"
    File "install.bat"
    File "ddos.py"
    File "dripper.bat"
    File "drippertopath.bat"

    WriteRegStr HKLM "Software\${APPNAME}" "Install_Dir" "$INSTDIR"
    WriteUninstaller "$INSTDIR\Uninstall.exe"

    ExecWait '"$INSTDIR\install.bat"'
SectionEnd

Section "Uninstall"
    RMDir /r "$INSTDIR\Dripper Free"
    RMDir /r "$INSTDIR"

    DeleteRegKey HKLM "Software\${APPNAME}"
SectionEnd

UninstPage uninstConfirm
Uninstpage instfiles
