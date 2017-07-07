#签名移动要配置正确
cd /Users/mingjiang/Desktop/ComeSave1.22
rm ../ver2
mv ../ver1 ../ver2
svn update > ../ver1
diff ../ver1 ../ver2
if [ $? == 0 ]; then
	   exit 0;
   fi
   xcodebuild -workspace ComeSave.xcworkspace -scheme ComeSave -configuration Release -sdk iphoneos10.0 clean
   xcodebuild -workspace ComeSave.xcworkspace -scheme ComeSave -configuration Release -sdk iphoneos10.0 build
   xcrun -sdk iphoneos packageapplication -v /Users/mingjiang/Library/Developer/Xcode/DerivedData/ComeSave-clogwjmbprnvakdnwldlrhlxvtfc/Build/Products/Release-iphoneos/ComeSave.app -o ~/test.ipa
   xcrun -sdk iphoneos PackageApplication -v build/Release-iphoneos/xxx.app -o build/Release-iphoneos/xxx.ipa

   curl -F "file=@/Users/mingjiang/test.ipa" -F "_api_key=c98d013b1a2cdf30410f7bbdbb2f6bfe" -F "uKey=123fe965b6f7a7a90cb2e88e5a2571a6" http://www.pgyer.com/apiv1/app/upload
   cp /Users/mingjiang/test.ipa /usr/local/var/www

