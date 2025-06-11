@echo off
:: Проверка прав администратора
fltmc >nul 2>&1 || (
    echo Требуются права администратора.
    PowerShell Start -Verb RunAs '%~f0' 2> nul || (
        echo Запустите этот скрипт от имени администратора.
        pause
        exit /b 1
    )
    exit /b 0
)

:: Скрыть расширения файлов
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 1 /f
if errorlevel 1 (
    echo Не удалось записать в реестр.
    pause
    exit /b 1
)

:: Перезапуск Проводника для применения изменений
echo Перезапуск Проводника...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo Расширения файлов теперь скрыты.
pause
