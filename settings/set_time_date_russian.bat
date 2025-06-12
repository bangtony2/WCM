@echo off
:: Check for administrator privileges
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

:: Set current user registry
reg add "HKCU\Control Panel\International" /v sShortTime /t REG_SZ /d "HH:mm" /f
reg add "HKCU\Control Panel\International" /v sTimeFormat /t REG_SZ /d "HH:mm:ss" /f
reg add "HKCU\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKCU\Control Panel\International" /v sShortDate /t REG_SZ /d "dd.MM.yyyy" /f
reg add "HKCU\Control Panel\International" /v sLongDate /t REG_SZ /d "dd MMMM yyyy" /f
reg add "HKCU\Control Panel\International" /v sDate /t REG_SZ /d "." /f
reg add "HKCU\Control Panel\International" /v Locale /t REG_SZ /d "00000419" /f
reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d "ru-RU" /f
reg add "HKCU\Control Panel\International" /v sCountry /t REG_SZ /d "Россия" /f
reg add "HKCU\Control Panel\International" /v sLanguage /t REG_SZ /d "RUS" /f

:: Set system-wide default user registry (for new users and system)
reg add "HKU\.DEFAULT\Control Panel\International" /v sShortTime /t REG_SZ /d "HH:mm" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sTimeFormat /t REG_SZ /d "HH:mm:ss" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sShortDate /t REG_SZ /d "dd.MM.yyyy" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sLongDate /t REG_SZ /d "dd MMMM yyyy" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sDate /t REG_SZ /d "." /f
reg add "HKU\.DEFAULT\Control Panel\International" /v Locale /t REG_SZ /d "00000419" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v LocaleName /t REG_SZ /d "ru-RU" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sCountry /t REG_SZ /d "Россия" /f
reg add "HKU\.DEFAULT\Control Panel\International" /v sLanguage /t REG_SZ /d "RUS" /f

:: Set system locale (CRITICAL for persistence)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v Default /t REG_SZ /d "0419" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v InstallLanguage /t REG_SZ /d "0419" /f

:: Set system-wide international settings
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sShortTime /t REG_SZ /d "HH:mm" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sTimeFormat /t REG_SZ /d "HH:mm:ss" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sShortDate /t REG_SZ /d "dd.MM.yyyy" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sLongDate /t REG_SZ /d "dd MMMM yyyy" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v sDate /t REG_SZ /d "." /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v Locale /t REG_SZ /d "00000419" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\International" /v LocaleName /t REG_SZ /d "ru-RU" /f

:: ADDED: Set Windows system locale (prevents reset after reboot)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Locale" /v "(Default)" /t REG_SZ /d "00000419" /f

:: ADDED: Set MUI language settings
reg add "HKLM\SYSTEM\CurrentControlSet\Control\MUI\Settings" /v PreferredUILanguages /t REG_MULTI_SZ /d "ru-RU" /f

:: ADDED: Set default input method to Russian
reg add "HKCU\Keyboard Layout\Preload" /v "1" /t REG_SZ /d "00000419" /f
reg add "HKU\.DEFAULT\Keyboard Layout\Preload" /v "1" /t REG_SZ /d "00000419" /f

:: ADDED: Set culture info for .NET applications
reg add "HKLM\SOFTWARE\Microsoft\.NETFramework" /v SystemDefaultUICulture /t REG_SZ /d "ru-RU" /f
reg add "HKLM\SOFTWARE\Microsoft\.NETFramework" /v SystemDefaultCulture /t REG_SZ /d "ru-RU" /f

:: ADDED: Additional Windows 10/11 specific settings
reg add "HKCU\Control Panel\Desktop" /v PreferredUILanguages /t REG_MULTI_SZ /d "ru-RU" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Control Panel\International" /v RestrictUILangSelect /t REG_DWORD /d 0 /f

:: ADDED: Set timezone to Moscow (optional - adjust as needed)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v TimeZoneKeyName /t REG_SZ /d "Russian Standard Time" /f

taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 >nul
start explorer.exe
