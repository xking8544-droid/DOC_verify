@echo off
REM DocuVerify Build Script
REM Compiles all Java source files for Tomcat deployment

echo ========================================
echo    DocuVerify - Build Script
echo ========================================

set TOMCAT_DIR=C:\apache-tomcat-9.0.97
if not exist "%TOMCAT_DIR%" set TOMCAT_DIR=C:\apache-tomcat-9
if defined CATALINA_HOME set TOMCAT_DIR=%CATALINA_HOME%
set TOMCAT_LIB=%TOMCAT_DIR%\lib
set PROJECT_DIR=%~dp0
set SRC_DIR=%PROJECT_DIR%src
set WEB_DIR=%PROJECT_DIR%web
set CLASSES_DIR=%WEB_DIR%\WEB-INF\classes
set LIB_DIR=%WEB_DIR%\WEB-INF\lib

REM Create output directories
if not exist "%CLASSES_DIR%" mkdir "%CLASSES_DIR%"
if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"

REM Compile Java files
echo Compiling Java source files...
javac -cp "%TOMCAT_LIB%\servlet-api.jar;%LIB_DIR%\*" -d "%CLASSES_DIR%" -sourcepath "%SRC_DIR%" %SRC_DIR%\com\docuverify\model\*.java %SRC_DIR%\com\docuverify\dao\*.java %SRC_DIR%\com\docuverify\crypto\*.java %SRC_DIR%\com\docuverify\util\*.java %SRC_DIR%\com\docuverify\filter\*.java %SRC_DIR%\com\docuverify\servlet\*.java

if %ERRORLEVEL% EQU 0 (
    echo Build successful!
    echo Deploy the 'web' folder to Tomcat webapps as 'DocuVerify'
) else (
    echo Build failed! Check errors above.
)
pause
