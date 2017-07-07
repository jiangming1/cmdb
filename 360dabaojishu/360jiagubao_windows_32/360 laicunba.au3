#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
Local $sFilePath = $CmdLine[1]
;"C:\Users\a\Downloads\r4650_laicunba_insider_20107_2.1.7.apk"
Run("360加固助手.exe")
Sleep(12999)
;InetGet("http://app.hzrrcd.com/laicunba/2016_"&@MON&"_"&@MDAY&"/laicunba_360.apk", $sFilePath, $INET_FORCERELOAD)
winmove("360加固助手","",0,0)
MouseClick("left",137,177)
Sleep(2999)
send($sFilePath)
send("{enter}")
MouseClick("left",100,450)
Sleep(99999)
#laicunba-android_114_jiagu_sign
#$CMD ='f:&&cd \360jiagubao_windows_32&&winscp.com /command "open sftp://root:7JZS5a@test.163.com/" "put C:\Users\Administrator\Downloads\360jiagubao_windows_32\jiagu\output\aontimer\laicunba-android_10_jiagu_sign.apk /opt/pic_test/" "exit"'
$CMD ='copy /y C:\Users\Administrator\Downloads\360jiagubao_windows_32\jiagu\output\aontimer\*  E:\nginx\html\'
RunWait(@ComSpec & " /c " & $CMD)