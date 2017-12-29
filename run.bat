@echo off

cd bin
java -Dfile.encoding=UTF-8 -classpath ..\lib\sqlite-jdbc-3.16.1.jar;..\lib\jsoup-1.11.2.jar;. Main
