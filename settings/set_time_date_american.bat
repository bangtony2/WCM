@echo off
:: Возврат формата даты и времени к американскому (en-US)

echo Установка американского формата времени и даты...

:: Краткий формат времени: ч:мм AM/PM
reg add "HKCU\Control Panel\International" /v sShortTime /t REG_SZ /d "h:mm tt" /f

:: Длинный формат времени: ч:мм:сс AM/PM
reg add "HKCU\Control Panel\International" /v sTimeFormat /t REG_SZ /d "h:mm:ss tt" /f

:: Разделитель времени
reg add "HKCU\Control Panel\International" /v sTime /t REG_SZ /d ":" /f

:: Краткий формат даты: М/Д/ГГГГ
reg add "HKCU\Control Panel\International" /v sShortDate /t REG_SZ /d "M/d/yyyy" /f

:: Длинный формат даты: День недели, Месяц ДД, ГГГГ
reg add "HKCU\Control Panel\International" /v sLongDate /t REG_SZ /d "dddd, MMMM dd, yyyy" /f

:: Разделитель даты
reg add "HKCU\Control Panel\International" /v sDate /t REG_SZ /d "/" /f

:: Установка региона на США
reg add "HKCU\Control Panel\International" /v Locale /t REG_SZ /d "00000409" /f
reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d "en-US" /f

:: Перезапуск проводника для применения изменений
taskkill /f /im explorer.exe
start explorer.exe

echo Формат времени и даты успешно установлен на американский.
pause
