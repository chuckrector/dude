@echo off

setlocal

set ELECTRON_DISABLE_SECURITY_WARNINGS=true
node_modules\.bin\electron electron-main.cjs %*


