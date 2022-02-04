@echo off
echo Packaging...
rm -rf dude-win32-x64
call npx electron-packager . dude --platform=win32 --arch=x64
du -sh dude-win32-x64
