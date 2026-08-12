@echo off
chcp 65001 >nul
title AirDrop 防火墙放行（需管理员）

:: 检测是否以管理员身份运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo  [提示] 本脚本需要管理员权限才能修改防火墙。
    echo  请关闭此窗口，然后右键本文件，选择“以管理员身份运行”。
    echo.
    pause
    exit /b 1
)

echo 正在为 AirDrop 添加防火墙入站规则（端口 8000）...
netsh advfirewall firewall delete rule name="AirDrop8000" >nul 2>&1
netsh advfirewall firewall add rule name="AirDrop8000" dir=in action=allow protocol=TCP localport=8000
echo.
echo  完成！手机现在可以连接本机 AirDrop 了。
echo  如果之前已运行过 AirDrop.exe，请退出后重新打开使其生效。
echo.
pause
