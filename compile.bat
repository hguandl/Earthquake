@echo off

javac -d bin -encoding UTF-8 -classpath src;bin;lib\sqlite-jdbc-3.16.1.jar;lib\jsoup-1.11.2.jar
copy /y res\* bin\
xcopy res bin\res\ /e /y
