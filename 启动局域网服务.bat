@echo off
title Excel图片提取工具 - 局域网服务
cd /d "%~dp0"

echo ========================================
echo   Excel 图片提取工具 - 局域网共享
echo ========================================
echo.
echo 正在获取本机局域网 IP 地址...

set "IP="
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-NetIPAddress -AddressFamily IPv4 | Where-Object InterfaceAlias -match 'WLAN|Wi-Fi|无线|以太网|Ethernet' | Where-Object IPAddress -notmatch '^127\.|^169\.254\.' | Select-Object -First 1).IPAddress"') do set "IP=%%a"

if "%IP%"=="" (
    echo [警告] 未能自动获取 IP，请手动运行 ipconfig 查看无线网卡的 IPv4 地址。
    set "IP=你的IP地址"
)

echo.
echo ========================================
echo   服务已启动！
echo.
echo   本机访问:  http://localhost:8080
echo   局域网访问: http://%IP%:8080
echo ========================================
echo.
echo 其他电脑连接同一个 WiFi 后，在浏览器输入上面的"局域网访问"地址。
echo 关闭本窗口即可停止服务。
echo.
python -m http.server 8080
echo.
echo 服务已停止。
pause