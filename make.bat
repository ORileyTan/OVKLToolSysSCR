mkdir release
cd release
mkdir bin
cd ../
"C:\Program Files\7-Zip\7z.exe" a -tzip exec.love ./src/*
move exec.love release/bin
pause