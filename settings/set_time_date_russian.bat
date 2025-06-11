@echo off
:: Установка русского формата времени и даты (например: 16:10 и 11.06.2025)

echo Установка форматов времени и даты на русский стиль...

:: Краткий формат времени: ЧЧ:ММ (24-часовой)
reg add "HKCU\Control Panel\International" /v sShortTime /t REG_SZ /d "HH:mm" /f

:: Длинный формат времени: ЧЧ:ММ:СС
reg add "HKCU\Control Panel\International" /v sTimeFormat /t REG_SZ /d "HH:mm:ss" /f

:: Разделитель времени
reg add "HKCU\Control Panel\International" /v sTime /t REG_SZ /d ":" /f

:: Краткий формат даты: ДД.ММ.ГГГГ
reg add "HKCU\Control Panel\International" /v sShortDate /t REG_SZ /d "dd.MM.yyyy" /f

:: Длинный формат даты: День недели, ДД MMMM ГГГГ (если хочешь – можно изменить)
reg add "HKCU\Control Panel\International" /v sLongDate /t REG_SZ /d "dd MMMM yyyy" /f

:: Разделитель даты
reg add "HKCU\Control Panel\International" /v sDate /t REG_SZ /d "." /f

:: Установка региона на Россию
reg add "HKCU\Control Panel\International" /v Locale /t REG_SZ /d "00000419" /f
reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d "ru-RU" /f

:: Перезапуск проводника, чтобы применить настройки
taskkill /f /im explorer.exe
start explorer.exe

echo Формат времени и даты успешно установлен на русский.
pause
