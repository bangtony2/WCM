@echo off
:: Установка русского формата времени и даты
reg add "HKCU\Control Panel\International" /v sShortTime /t REG_SZ /d "HH:mm" /f
reg add "HKCU\Control Panel\International" /v sTimeFormat /t REG_SZ /d "HH:mm:ss" /f
reg add "HKCU\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKCU\Control Panel\International" /v sShortDate /t REG_SZ /d "dd.MM.yyyy" /f
reg add "HKCU\Control Panel\International" /v sLongDate /t REG_SZ /d "dd MMMM yyyy" /f
reg add "HKCU\Control Panel\International" /v sDate /t REG_SZ /d "." /f
reg add "HKCU\Control Panel\International" /v Locale /t REG_SZ /d "00000419" /f
reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d "ru-RU" /f
