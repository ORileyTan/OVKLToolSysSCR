mkdir release
cd release
mkdir win64
cd ../
"C:\Program Files\7-Zip\7z.exe" a -tzip exec.love ./src/*
copy /b "bin\love-11.5-win64\love.exe" + exec.love release\win64\OVKLToolSysSCR.scr
del exec.love
copy /b "bin\love-11.5-win64\*.dll" release\win64
copy "bin\love-11.5-win64\license.txt" release\win64
copy "include\*" release\win64
pause