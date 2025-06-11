@echo off
:: Возврат формата даты и времени к американскому
reg add "HKCU\Control Panel\International" /v sShortTime /t REG_SZ /d "h:mm tt" /f
reg add "HKCU\Control Panel\International" /v sTimeFormat /t REG_SZ /d "h:mm:ss tt" /f
reg add "HKCU\Control Panel\International" /v sTime /t REG_SZ /d ":" /f
reg add "HKCU\Control Panel\International" /v sShortDate /t REG_SZ /d "M/d/yyyy" /f
reg add "HKCU\Control Panel\International" /v sLongDate /t REG_SZ /d "dddd, MMMM dd, yyyy" /f
reg add "HKCU\Control Panel\International" /v sDate /t REG_SZ /d "/" /f
reg add "HKCU\Control Panel\International" /v Locale /t REG_SZ /d "00000409" /f
reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d "en-US" /f
