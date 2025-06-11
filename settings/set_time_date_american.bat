fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion

@echo off
echo Setting US English regional settings (permanent)...

:: Set current user registry
reg add "HKCU\Control Panel\International" /v sShortTime /t REG_SZ /d "h:mm tt" /f
reg add "HKCU\Control Panel\International" /v sTimeFormat /t REG_SZ /d "h:mm:ss tt" /f
reg add "HKCU\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKCU\Control Panel\International" /v sShortDate /t REG_SZ /d "M/d/yyyy" /f
reg add "HKCU\Control Panel\International" /v sLongDate /t REG_SZ /d "dddd, MMMM dd, yyyy" /f
reg add "HKCU\Control Panel\International" /v sDate /t REG_SZ /d "/" /f
reg add "HKCU\Control Panel\International" /v Locale /t REG_SZ /d "00000409" /f
reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d "en-US" /f

:: Set system-wide default user registry (for new users and system)
reg add "HKU\.DEFAULT\Control Panel\International" /v sShortTime /t REG_SZ /d "h:mm tt" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sTimeFormat /t REG_SZ /d "h:mm:ss tt" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sShortDate /t REG_SZ /d "M/d/yyyy" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sLongDate /t REG_SZ /d "dddd, MMMM dd, yyyy" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sDate /t REG_SZ /d "/" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v Locale /t REG_SZ /d "00000409" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v LocaleName /t REG_SZ /d "en-US" /f

:: Set system locale
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v Default /t REG_SZ /d "0409" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v InstallLanguage /t REG_SZ /d "0409" /f

:: Set control panel settings to persist
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sShortTime /t REG_SZ /d "h:mm tt" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sTimeFormat /t REG_SZ /d "h:mm:ss tt" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sShortDate /t REG_SZ /d "M/d/yyyy" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sLongDate /t REG_SZ /d "dddd, MMMM dd, yyyy" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sDate /t REG_SZ /d "/" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v Locale /t REG_SZ /d "00000409" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v LocaleName /t REG_SZ /d "en-US" /f

echo US English regional settings applied successfully!
echo Restarting Windows Explorer to apply changes...

taskkill /f /im explorer.exe
start explorer.exe

echo Done! Settings will persist after reboot.
pause
