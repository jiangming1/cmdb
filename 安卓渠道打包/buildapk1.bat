echo "单apk打包"
set /a TODAY=%date:~0,4%%date:~5,2%%date:~8,2% 
set _TIME=%time:~0,8% 
set CURRENTTIME=%_time::=% 
set CURRENTTIME=%CURRENTTIME: =0% 
set MYDIR=%TODAY%_%CURRENTTIME% 
echo %MYDIR%
d:

cd /laicunba_android_studio
rd /q/s D:\laicunba_android_studio\app\build\outputs\apk

copy /y d:\bijiao1.txt d:\bijiao2.txt
svn cleanup

svn update>d:\bijiao1.txt
sed -i 's/minifyEnabled true/minifyEnabled false/g' D:\laicunba_android_studio\app\build.gradle
#sed -i 's/minifyEnabled false/minifyEnabled true/g' D:\laicunba_android_studio\app\build.gradle
svn log -v -l1 d:\laicunba_android_studio| grep  " 1 " |cut -d "|" -f 1|sed s/[[:space:]]//g>version.txt

for /f "delims=" %%a in (version.txt) do (
set version=%%a
echo !version!
)
set MYDIR=%version%_%TODAY%_%CURRENTTIME%
set MYNAME="%version%_Laicunba_insider_%TODAY%_%CURRENTTIME%.apk"

fc /b d:\bijiao1.txt d:\bijiao2.txt &&echo 相同||gradle :app:assembleLaicunba_insiderRelease&&cd D:\laicunba_android_studio\app\build\outputs\apk&&dir /b laicunba*.apk > xsxxb.tmp&&for /f "eol=| delims=|" %%i in (xsxxb.tmp) do (copy /y "%%i" E:\nginx\html\%version%_%%i&&copy /y "%%i" C:\Users\a\Downloads\r4650_laicunba_insider_20107_2.1.7.apk&&curl -F "file=@C:/Users/a/Downloads/r4650_laicunba_insider_20107_2.1.7.apk" -F "_api_key=c98d013b1a2cdf30410f7bbdbb2f6bfe" -F "uKey=123fe965b6f7a7a90cb2e88e5a2571a6" http://www.pgyer.com/apiv1/app/upload)
rem C:\Users\a\Downloads\r4650_laicunba_insider_20107_2.1.7.apk
rem copy /y D:\laicunba_android_studio\app\build\outputs\apk\app-laicunba_insider-release-unaligned.apk  E:\nginx\html\%MYNAME%
if errorlevel 1 exit
forfiles /p E:\nginx\html\ /m *.apk -d -60 /c "cmd /c del /f @path"

