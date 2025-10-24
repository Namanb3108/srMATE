@echo off
title srMATE - College Connection App
color 0A

echo ========================================
echo        srMATE Application Launcher
echo ========================================
echo.

echo [1/2] Compiling SrMateApp.java...
javac -cp ".;mysql-connector-j-8.2.0.jar" SrMateApp.java

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Compilation failed!
    pause
    exit /b 1
)

echo [2/2] Launching srMATE...
echo.

java -cp ".;mysql-connector-j-8.2.0.jar" SrMateApp

pause