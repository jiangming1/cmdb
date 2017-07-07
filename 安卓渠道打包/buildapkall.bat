echo "apk所有打包 必须输入buildapkall.bat r版本号"
set /a TODAY=%date:~0,4%%date:~5,2%%date:~8,2%
set _TIME=%time:~0,6%
set CURRENTTIME=%_time::=%
set CURRENTTIME=%CURRENTTIME: =0%
set MYDIR=%TODAY%_%CURRENTTIME%
echo %MYDIR%
d:
cd d:\laicunba_android_studio
del /q/s D:\laicunba_android_studio\app\build\outputs\apk\*
move d:\buildapk.bat d:\buildapk1.bat
sed -i 's/minifyEnabled false/minifyEnabled true/g' D:\laicunba_android_studio\app\build.gradle
svn cleanup
svn update -%1
svn log -v -l1 d:\laicunba_android_studio| grep  " 1 " |cut -d "|" -f 1|sed s/[[:space:]]//g>version.txt

for /f "delims=" %%a in (version.txt) do (
set version=%%a
echo !version!
)
set MYDIR=%1_%TODAY%_%CURRENTTIME%
gradle clean&&gradle assembleRelease&&mkdir E:\nginx\html\%MYDIR%&&cd D:\laicunba_android_studio\app\build\outputs\apk&&dir /b *_2*.apk > xsxxb.tmp&&for /f "eol=| delims=|" %%i in (xsxxb.tmp) do (set MYNAME=%version%_%%i&&copy "%%i" E:\nginx\html\%MYDIR%\%version%_%%i)&&move d:\buildapk1.bat d:\buildapk.bat

rem gradle assembleRelease&&cd D:\laicunba_android_studio\app\build\outputs\apk&&dir /b laicunba*.apk > xsxxb.tmp&&for /f "eol=| delims=|" %%i in (xsxxb.tmp) do (set MYNAME=%version%_%%i&&copy "%%i" E:\nginx\html\%MYDIR%_%%i)


rem gradle build

forfiles /p E:\nginx\html\ /m *.apk -d -7 /c "cmd /c del /f @path"
